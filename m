Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969550;
	b=Ju/OtgKSgOLX8Qwhaa8uYnC5fUpav9u/DIVwGvheargzffeTzRyJEuABIbXPzW+Jn3V/
	 ueLGuaVlY7kWhreMALaL3z492l53c6fVbPyhn+YS3Xb1wCBEkt3IwbCk0NYgR/hBPtg4n
	 MurlMHF4jx5WLnmloJwrDo3saCj8p8bBRnXYLwuKAK6DFUm9Ux88ScdKe076qnqDlmYFp
	 tHPqXKdkEvac2bQP1inQyUXGJaaUFODRvqc5UKs7+L8WGcuBzYh2hc2v+xPqjkE/kw82C
	 kLJciyumUNEOvG3gn6PykO88f1ezEv+EP8wc34x6193uw/XQMElPW03SoZq9+T0jQ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969550;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OnFPwP3JQiVqgsjHEOBwqd+gkfyHd3yYnDMYTlT4DLo=;
	b=iVT8U64VA6j2WqTZWTFiHBhAwLkq3/pszPlhJxs/yD36A3JZULOFMuRgQtHN7HNiOevI
	 ZZvQk5PpwhcWhuYMGgAKFWhKmes6NS72JGfOaN/lvZ8pKna3uQt/C2ZRJjDiecg2yzegP
	 ObqYBEerwzq+8jAym++jpCGDJKZ/297a0d3UunCOArF7joSyKNV8opK00RI0GzOMBGtqW
	 sZuQUI2KR2ElXewzBQlYwYcCfGWNFuE2ylp4nyZEm1gpInY/vGHoFuGnaNXxQFekKEKgD
	 X2h8sEY8t0m5Thki5xz5z57lAqnW91wylcpBr2QvZqFVLAEjOEAMBTfwSy88CMkTM/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XZZ8cUAy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36808606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XZZ8cUAy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB20D1F000C7;
	Wed, 18 Nov 2026 02:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969550;
	bh=OnFPwP3JQiVqgsjHEOBwqd+gkfyHd3yYnDMYTlT4DLo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XZZ8cUAydkLHd7o/i/Oth6Djstipr1FB0puTzVx2EqQDc5x59g0zBhFSiDK835S+Q
	 RpwbvOsZwRRFx+0GjqrDWcZywxxzNbsKTjGtjqAipn/89aCYAdRNat8BnVOMUQPf8j
	 U9ZQp3f3qSZjA/mR9DQk+tWFIYU3QMmrPHbKoxzhAKmpVsRTsZbrJErzkwY2BjpeOn
	 wGYN6ri6+ep9wvsD6tqgHjenpnYnOj2Qr1RSrBpRuIm0+/A25ayhje6S7xiyvBM7V3
	 G/bTpwPaHXfv/v2PVt8dSWM09a5vpplYYzErVAqYH4j+YJXgdoa7XQAVVJwH+F+Sw7
	 qJje6+MJDw8Jw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 1/6] eth: bnxt_en: order event data before setting the sp_event bit
Date: Tue, 17 Nov 2026 18:39:00 -0800
Message-ID: <20261118023905.3050661-2-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118023905.3050661-1-kuba@kernel.org>
References: <20261118023905.3050661-1-kuba@kernel.org>
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

Callers of bnxt_queue_sp_work() may store data for bnxt_sp_task()
right before raising the event, e.g. the IRQ affinity notifier
publishes the new TPH Steering Tag. set_bit() is not ordered, so on
weakly ordered architectures the event bit may become visible first.
If bnxt_sp_task() is already running it can consume the event and
read the stale data. The queue_work() which follows only re-runs
the task with the event bit already cleared, so the update is lost.

Add smp_mb__before_atomic() before setting the bit, it pairs with
the fully ordered test_and_clear_bit() in bnxt_sp_task().

Reported by an LLM reviewer while working on subsequent patches.
Very unlikely to matter in practice.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 6846a27bfef4..5ad2a3033505 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -394,6 +394,10 @@ static void __bnxt_queue_sp_work(struct bnxt *bp)
 
 static void bnxt_queue_sp_work(struct bnxt *bp, unsigned int event)
 {
+	/* Make the data the event carries visible before the event bit,
+	 * pairs with test_and_clear_bit() in bnxt_sp_task().
+	 */
+	smp_mb__before_atomic();
 	set_bit(event, &bp->sp_event);
 	__bnxt_queue_sp_work(bp);
 }
-- 
2.56.1

