<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mathify - Checkout</title>
    <%-- Load Snap from sandbox or production depending on the configured environment. --%>
    <script type="text/javascript"
            src="https://${isProduction ? 'app' : 'app.sandbox'}.midtrans.com/snap/snap.js"
            data-client-key="${clientKey}"></script>
    <style>
        body { font-family: 'Inter', sans-serif; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; background-color: #f3f4f6; }
        .checkout-card { background: white; padding: 2rem; border-radius: 12px; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1); text-align: center; max-width: 400px; width: 100%; }
        h1 { color: #1f2937; margin-bottom: 0.5rem; }
        .plan { color: #3b82f6; font-weight: 600; letter-spacing: .05em; text-transform: uppercase; font-size: 13px; margin-bottom: 1rem; }
        p { color: #4b5563; margin-bottom: 2rem; }
        .pay-button { background: #3b82f6; color: white; border: none; padding: 12px 24px; border-radius: 8px; font-size: 16px; font-weight: 600; cursor: pointer; transition: background 0.2s; width: 100%; }
        .pay-button:hover { background: #2563eb; }
        .pay-button:disabled { background: #9ca3af; cursor: not-allowed; }
        .error-msg { color: #ef4444; margin-bottom: 1rem; font-weight: 500; }
        .env-badge { display: inline-block; margin-top: 1rem; font-size: 11px; color: #9ca3af; }
    </style>
</head>
<body>

    <div class="checkout-card">
        <h1>Premium Upgrade</h1>
        <div class="plan">${planName} plan</div>
        <p>You are about to purchase Mathify Premium for <strong>Rp ${grossAmount}</strong>.</p>

        <c:if test="${not empty error}">
            <div class="error-msg">${error}</div>
        </c:if>

        <button id="pay-button" class="pay-button" ${empty snapToken ? 'disabled' : ''}>Proceed to Payment</button>
        <div class="env-badge">${isProduction ? 'Live payment' : 'Sandbox — test mode, no real charge'}</div>
    </div>

    <script type="text/javascript">
      var ctx = '${pageContext.request.contextPath}';
      var confirmUrl = ctx + '/payment/confirm?orderId=${orderId}';

      var payButton = document.getElementById('pay-button');
      if (payButton && '${snapToken}') {
        payButton.addEventListener('click', function () {
          window.snap.pay('${snapToken}', {
            // Server re-verifies with Midtrans before granting premium — never trust these callbacks alone.
            onSuccess: function (result) { console.log(result); window.location.href = confirmUrl; },
            onPending: function (result) { console.log(result); window.location.href = confirmUrl; },
            onError:   function (result) { console.log(result); alert('Payment failed. Please try again.'); },
            onClose:   function () { alert('You closed the popup before finishing the payment.'); }
          });
        });
      }
    </script>
</body>
</html>
