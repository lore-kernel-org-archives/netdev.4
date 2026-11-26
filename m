Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657416;
	b=zGr3hWbBwZ6VFkwmAxAe/5yXVeNHeXSU1W8lbwr13T8vzDXe6uhsYdvLKzSep7lWlAUe
	 QetL6cC+V1ckp2cb8kNOUbBXaCt+AdReN2xEm2FWqLJP61EurH6njSqrZILKQXFhRYRkz
	 O1eqznReIatKzNnBMXWmPqyFdkzoSt0YCf7mbIZAoZ62TLuPyGFF3iCDXnGvqhjuCTKAh
	 NpGUDWJSIgj21zru/L4DN9DZx1woULgx4g05AQ0W/1MLQC+x378OQ4SVo6f2LGJWRpLkc
	 6sfqqMI1ula9NmCsOv+5Rzg81QR+s9Q9SdwsvEdZxRF3+FndOKP6kwthfgzsDey4ehg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657416;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=8IuEO7UE2YPsr6kQNPAUlV208dDrufnV7pr9TuunrwU=;
	b=p44ILKy7lSx+a2CTIS4L0Pvr5QZVHZAA7m5jfesNwXh6VVB3h5wNxYdp0nCh6Rci7xhk
	 pk4ykHWKGtRJ2QRKE470DZ367TtX7aZPjSVhGTum5ovH92lzkxrmy5Vz6GsbIIIuGaDHv
	 B326iW7PbyaQ4FVr6jQK/qEAyQ5uUKp5s51uBb8odn93TyN7WI8KbbJUd5Y4eqSQHnQgs
	 oDX6+/MLl96N07/q0cKZjegt5URpKHOsrb6Yrx3qsAkC9ELqjoK44/QHtb0vcF9tw1iD+
	 w/AFxtyuwMMtz0IzVNKGY0OEbkc8VOhTi7Cj2ZiJUZpqNlxWBQdEiseTjYD5ZivJYUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LfygWFme;
	arc=none smtp.remote-ip=74.125.82.227
Received: from mail-dy1-f227.google.com (mail-dy1-f227.google.com [74.125.82.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEED606A32E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EEED606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LfygWFme
Received: by mail-dy1-f227.google.com with SMTP id 5a478bee46e88-3866a784546so8821242eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1795657415; x=1796262215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8IuEO7UE2YPsr6kQNPAUlV208dDrufnV7pr9TuunrwU=;
        b=LfygWFmesZKKfM8+8Ky9IjZuIRANhsNbfh2Xy8WPJVf2zC/b7ecZoMEtERRuiTeh8P
         CkDHvZDrCMJedrVyfZaJ9zc7pGMGcBNjBo1PNM0/wL0Wod7iBIXgSyNkyrX/aIq+wXYu
         mBIJD0A3OIQDehbTN8GfWQchcZAoID/aYkpel+blHSaZFQ3IVVo8XniZdVgRu8u7K/1E
         ZNqTbF2ZPnsh6toxBjIT2GWb75wD57NMAQrZ3rLmYgGUHDtgN9EmbftVd12I/eab3NVG
         gfjjT5uXFbR7sMXKvdLBV9qfmHktvM5uldH7LgGTG5hHD5V05YJD/O7xLpChNk6oXeEb
         gkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657415; x=1796262215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8IuEO7UE2YPsr6kQNPAUlV208dDrufnV7pr9TuunrwU=;
        b=GYAPmsH+k0ZmFWlgF2a6wnuPzarNIUY5Lb+lRndfqEEYf6w/kFbSYsVA9GMsEsJ4Io
         LxndP02QOqtH+GlO0ZqD/YIykJe2K309BjmGROSqiPpxQd1iZMziV7FXS/JllLyw4Avf
         RB2MUN1nmyMWZn75Gu/q3Shc5FykTQuQO+I/BdDex/ukwJf+x4xZXnKYa3M7GyT9bnop
         uBXLYM9caSci6OhrtONkZCWzvmPDV8SC2ZJAPKmdCkD3kJdyDYz3zSuRDtoaQTmtEpfV
         yME6iT1HNeGZ8u7YcS6niuxQOsy28C2H3K4vXyTB77IJ7o9i01o+d4vi09qb6pdyeCzk
         q4Dw==
X-Gm-Message-State: APuU4Z9FPx085GXH6X9L1b9EHUGh2KnTIenH3efgGPzYnYHYceeXhflV
	72Q/Kclfj83yw7DN/Mq+Y99W4Ton66EDsFpDmXuMU6op/Y3HcZ9+mf0G5TmGRFl4yLgPtKeJDAb
	2/zSkiyPjhatB1pH0NiVOBzXODIpEcvxIz+26
X-Gm-Gg: AZFdTZe8f1dvIBOMoREpqTxx/4jIxm9kAivvLX0LLjNTfa/bnwyTDqIvHmsbw7G9fPu
	nijjwFqofZgbs6214vwo6EDjdipXkPtfME5n1BtLD9cvLbqeg+shOfryYqDdO6MFBLhvBMnSSc9
	/Sno1Sn0Iyew3QYJJ3dBoHgOI2Q6vOdv9XTWCS+TyQJUawzegkdVBsBgzrR9xv40IUjKXAB8bi8
	Z6rgLYNxTOPNv7Tg5cwzGzXDvCGQsNHaThL61cPCnaHAxzJ8aSVLs6YKiizLAC50TXjfiwVad//
	zFggoIsHt8y4+o/3OS4DmvTKW+Wfkd9J3uKfXJcZk421m5UoP/9oe6YJatl2FCI2eX+OYmt3fXV
	mMIcLQpTLtegyrjA7ImGNYZbgdQXcqxfOW4k=
X-Received: by 2002:a05:7301:2e30:b0:376:19bd:2af9 with SMTP id 5a478bee46e88-3856c2c4a0dmr22218236eec.5.1795657415329;
        Wed, 25 Nov 2026 17:43:35 -0800 (PST)
Received: from c7-smtp-2026.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-38566cd605dsm2953154eec.12.2026.11.25.17.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:43:35 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-rjethwani.dev.purestorage.com (dev-rjethwani.dev.purestorage.com [10.17.2.234])
	by c7-smtp-2026.dev.purestorage.com (Postfix) with ESMTP id 834BB400B7;
	Wed, 25 Nov 2026 18:43:34 -0700 (MST)
Received: by dev-rjethwani.dev.purestorage.com (Postfix, from userid 1557719937)
	id 80281DC0C28; Wed, 25 Nov 2026 18:43:34 -0700 (MST)
From: Rishikesh Jethwani <rjethwani@purestorage.com>
To: netdev@vger.kernel.org
Cc: Rishikesh Jethwani <rjethwani@purestorage.com>,
	stable@vger.kernel.org,
	John Fastabend <john.fastabend@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Alice Mikityanska <alice.kernel@fastmail.im>
Subject: [PATCH net v7 1/3] tls: fix socket use-after-free during device-down
Date: Wed, 25 Nov 2026 18:42:42 -0700
Message-ID: <20261126014327.1638133-2-rjethwani@purestorage.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261126014327.1638133-1-rjethwani@purestorage.com>
References: <20261126014327.1638133-1-rjethwani@purestorage.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tls_device_down() takes a reference on each TLS context, then drops
tls_device_lock before setting ctx->sk->sk_validate_xmit_skb to
tls_validate_xmit_skb_sw(). The socket can be freed in between:
tls_device_sk_destruct() calls tls_device_queue_ctx_destruction(),
which drops the socket's context reference but does not free the
context because device-down still holds one, and __sk_destruct() then
frees the socket.

Set sk_validate_xmit_skb while walking tls_device_list under
tls_device_lock. tls_device_queue_ctx_destruction() takes the same lock
to drop its reference and remove the context from the list, so the
socket cannot be freed before the store completes.

Checking sk_refcnt instead would not work: it can already be zero while
queued SKBs still hold sk_wmem_alloc and need the software fallback.

Found by code inspection. An ASan harness running the extracted teardown
functions with userspace shims reproduces the UAF before this fix and
passes afterward. Tested on Mellanox ConnectX-6 Dx (Crypto Enabled).

Fixes: c55dcdd435aa ("net/tls: Fix use-after-free after the TLS device goes down and up")
Cc: stable@vger.kernel.org # needs commit f08d8c1bb97c ("net/tls: Fix race in TLS device down flow")
Signed-off-by: Rishikesh Jethwani <rjethwani@purestorage.com>
---
 net/tls/tls_device.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/net/tls/tls_device.c b/net/tls/tls_device.c
index fa7170cd4fd1..3ea764bdc949 100644
--- a/net/tls/tls_device.c
+++ b/net/tls/tls_device.c
@@ -1345,6 +1345,11 @@ static int tls_device_down(struct net_device *netdev)
 		    !refcount_inc_not_zero(&ctx->refcount))
 			continue;
 
+		/* Stop offloaded TX and switch to the fallback.
+		 * tls_is_skb_tx_device_offloaded will return false.
+		 */
+		WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xmit_skb_sw);
+
 		list_move(&ctx->list, &list);
 	}
 	spin_unlock_irqrestore(&tls_device_lock, flags);
@@ -1352,11 +1357,6 @@ static int tls_device_down(struct net_device *netdev)
 	list_for_each_entry_safe(ctx, tmp, &list, list)	{
 		bool free_ctx;
 
-		/* Stop offloaded TX and switch to the fallback.
-		 * tls_is_skb_tx_device_offloaded will return false.
-		 */
-		WRITE_ONCE(ctx->sk->sk_validate_xmit_skb, tls_validate_xmit_skb_sw);
-
 		/* Stop the RX and TX resync.
 		 * tls_dev_resync must not be called after tls_dev_del.
 		 */
-- 
2.50.1

