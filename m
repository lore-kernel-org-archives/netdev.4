Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703423;
	b=0kX/nf+28JfSKi7+CeCtdiW0CtRrTvzYuLGqd/atkBmbJ7WvpUCElr/HuqEat3ChVtc9
	 28uus77rGMoTKzzsY1SEBklA9dUWUwGICG5dOCJGkHStqf8FErBsFsceEBKmlbpyxg1ud
	 LiOq5nwboNW3aeowf7mVKVCjSbeDNFu8HhHo/qXkIQUJF3kFJ//vuG0riclqDLN8YghWo
	 qVKUqK2xMlipqQ07VpD0+sAMvj3w8j36NvaPxk7r+3D+JE+uJhp3FfSGUwPavkcgJL4vb
	 yk8OtHx5e4hFrAgS3kAxZyqTuX+skA7wP6J6Oheg0PPH2rGeSECd1LDw0UbAky55Glg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703423;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=AkPbh8+KOu2hEsqFeAAkm+a8IjfaUYYB3rND+Zn5rag=;
	b=grPhciF3rLbmdo+zKGzov6aYNT3nAL0QPGpOoStNkP68N5MZtUS27uZWN5UvzKcJIbxw
	 0yCJG6NBKE3x1Mzws2w07sxFo8IIPwg+HmX3wMtjFZuvbApVTUoejN+UiXrN66CqiONpj
	 KlPgq4NzimdGRofXaAa/6GEXdTdOYrhRZPjxz/MLurNWHiPIwSMxgVLnSmyDMHDbSkpal
	 y3Ihzl6wNk6aNzUPwugIsxyi54vdlfrc1SNxwFOuWGAwviprV+aCYIzOf1zztcejvYYwI
	 LiWw/kwy2vCw7b7JdVtMGamd1RmOPhUvoBGyihauCiaBB2l9HDXbGaFFl4BAkC0YN6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kMkJV8Q7;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95751606A684
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:30:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95751606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kMkJV8Q7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EBE68C2B9D1;
	Thu, 26 Nov 2026 14:30:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 78C89604ED;
	Thu, 26 Nov 2026 14:30:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC64011E683DB;
	Thu, 26 Nov 2026 15:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795703419; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=AkPbh8+KOu2hEsqFeAAkm+a8IjfaUYYB3rND+Zn5rag=;
	b=kMkJV8Q725j5hErRfJ74sJbGvw2UwniaL6L1vivoWIaLyYgeNO1mlS3dy8CTXOb7NL2TB8
	RN1JnrOV7taZniMV1jsLCARK+7i4El09wGlm4sqFgtGf/DtNp7ybq4YNGZZbrTG7PHbhrm
	Ls9FpXE69PG5JcRuLGgJaBHYw1Z7AQZo6CEvAIXqPAZ6Bg0hsGgT/tF11blYnEIg2/1hUe
	Dwt+8e6wvPZRrwccCGQSkprEYZVHjmM8+hQd0bY2veDW8ztaOyiILJ5giUSnX3ryAoLan8
	+k4x66Z9JYzcwArbyFjqdwuXHxIF5YOWoDLjzTMGks03zRzxnS5WKaxdz9Z2WA==
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Kory Maincent (Dent Project)" <kory.maincent@bootlin.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>
Subject: [PATCH net-next] net: pse-pd: fix bogus budget evaluation strategy check in IRQ handler
Date: Thu, 26 Nov 2026 15:30:02 +0100
Message-ID: <20261126143012.1595919-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
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
X-Last-TLS-Session-Version: TLSv1.3

pse_set_config_isr() wrongly tested the PSE event notification bitmask
against PSE_BUDGET_EVAL_STRAT_DYNAMIC, a budget evaluation strategy
constant that has nothing to do with event notifications.

The mistake went unnoticed because ETHTOOL_C33_PSE_EVENT_DETECTION and
PSE_BUDGET_EVAL_STRAT_DYNAMIC are both BIT(2) and, when only the
detection event is reported, the function performs no action anyway.
The check does not prevent the TPS23881 from working properly, but when
a controller reports the detection event together with other events,
the whole notification handling is skipped instead of processed.

Remove this bogus check.

Fixes: ffef61d6d2737 ("net: pse-pd: Add support for budget evaluation strategies")
Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Found this issue while developing the support for the TPS23861 version of
the controller.

As the TPS23881 driver (the only user of this path) works fine with this
bogus check, I am sending the fix to net-next.

If any developer of the SUIE or Sashiko passes by, I would like to point
out that all my PSE patches and fixes are registered under the DENT
company, which is wrong as I am not working for them anymore.
---
 drivers/net/pse-pd/pse_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index a3d4a3d7e5257..59cc0dcfa2a4b 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -1205,9 +1205,6 @@ static int pse_set_config_isr(struct pse_controller_dev *pcdev, int id,
 {
 	int ret = 0;
 
-	if (notifs & PSE_BUDGET_EVAL_STRAT_DYNAMIC)
-		return 0;
-
 	if ((notifs & ETHTOOL_C33_PSE_EVENT_DISCONNECTION) &&
 	    ((notifs & ETHTOOL_C33_PSE_EVENT_DETECTION) ||
 	     (notifs & ETHTOOL_C33_PSE_EVENT_CLASSIFICATION))) {
-- 
2.43.0

