Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567355;
	b=qm2O4BRg9lgAYebSsSXXSYBAS0enW32fIaDu1tyv2sQrNUch749kl1M+iNleKCEwFoob
	 57ff2fHogdJNDjG7AmvjkndUZFZtUlIp8uW3pTEaX0dJBH+WPqpQ8n3OPP/w3koyKm29c
	 rQ1fOCrvCCsl5htOcdYHQFI5Vt+HugwLP3RPCJAsKS+gbg2QALY9+mfhkR6eQC2yGD1ae
	 5+mBTr0Vn6a31tZ0fIUIugxCd4YOt7DUAj/+02nucZpYx0k6d2KDgTP/fvvyVEw2hYWUd
	 +P+Y6ePbHMO8rbkYIy+x4iPdq/MVkXHJMZpJP+e0VGrP66DTD1FRHnBag2fB6yx6G2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=DJaULlw9P76gCMaxbfqkW+X00CP+ZRvX8/uOejfUnxI=;
	b=ifIVA/YY6uH4nm5lKHCGReAqW3VnByn6x2kjO3RlJO7J5bd4G8V1LFA9stcXDK9n/SWd
	 eJ+Js5A6HhDA6uuEdkPKxu3wSUBRXAXq5fzjn0otvTcPSQx9BXkIKJN5hSdQwo2AywXoG
	 jXZshIwtR9yiXur0FSfJX55Wdmaj1dmML1nbg2i5QJ6gozuA4k4smEHJDKQqMk8Nf1SYP
	 HHH/O72EKaVhFQlfxllEGqEkrjZTM5eIMcU/ZslpL82evc9uFg2HNqdaEKuuo3+vilSDA
	 Kjyw89CuE8OpWwHtHI7NSz3nK5SrlE8oCmDfpZiMAwLMgQdM0S/LgnItV28MVT/ZI0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktNZPZXw;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA1E606A331
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CA1E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ktNZPZXw
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6894674eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567354; x=1796172154; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DJaULlw9P76gCMaxbfqkW+X00CP+ZRvX8/uOejfUnxI=;
        b=ktNZPZXwFDciOvnoFSvd4ESNP8MXfUn0OPiq0u7CCmDDlGkLRqqPW0lU50+7vnhOSR
         DZ5hJGudEuJNSWE8EdzoEgc09LlJ4GFY549tm08+KLC5FOTBbUtdgSbLzoaNqbS/d1Gl
         vO2coXwtDOqy0plrg8129dWP8aB02ivAFjivJXkrblN8RcAXt1d4P5AiDpOCxZ6RXRnU
         v/3Tgmn2sOgpTmVCwG6c90vE3v+8gtQt2ypAO70QLdHvIMppnBtTBfPQjlBStcop9tfe
         xC6jNCjmG4EO28vdoExDbv8DkvJgiUQJqB2XsoLx8C6jKIPNTNIRHraSTKYk6/yZrx/5
         PEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567354; x=1796172154;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DJaULlw9P76gCMaxbfqkW+X00CP+ZRvX8/uOejfUnxI=;
        b=A/nc1W6pVmnE4JLdhtV7oBjcMun5SKD4ZXk9kfA73GCIDixMEwNYdfNnDLBHHis0rC
         gwzFV5LcReOFpq4MYvYcS8xeBvXj0VzKGeSDYWiZih1r1MG0WwadgEaA6IwVKo9/emEI
         uj1THETfSGFnnKilHl+sEM2grE73YtaXqo+luJvREYzUpEdXgByI7oCdUK4LItFXjNgQ
         EezOxZb+Z0bPhzesEZBonKfOjveOKvtH+MMx53Uz0mwPbWLRcIPGFsyeMpe8Nld5/+J6
         42/7yMSz+IkflZbyzEJcUaFW9Ur/vA7gbhyenWYMTx8o/Ly2cPbe7yqSGbdyrXi4+lcz
         557w==
X-Gm-Message-State: APuU4Z+V1hjczsYkY17D0YrX+0/PiQK535f+s5N4e4Nn8YBJzlz3FG6o
	KYGzOuYqKraAG3z7alTD1BF3op3/EK3mUf/fQbTfYwSMWzlqXRkIR80OoPb6J6pN8QchwBogqXH
	GrawlEMlAAQ==
X-Received: from dybmf45.prod.google.com ([2002:a05:7301:92d:b0:386:c9b4:86cd])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6192:10b0:386:a7f2:88e2
 with SMTP id 5a478bee46e88-386a7f28967mr9694191eec.23.1795567354105; Tue, 24
 Nov 2026 16:42:34 -0800 (PST)
Date: Tue, 24 Nov 2026 16:42:31 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004231.1007868-1-irogers@google.com>
Subject: [PATCH net-next v3] tg3: Avoid writing uninitialized MII_CTRL1000 in tg3_phy_reset_5703_4_5()
From: Ian Rogers <irogers@google.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>, Michael Chan <michael.chan@broadcom.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In tg3_phy_reset_5703_4_5(), if MDIO reads fail across all 10 iterations
of the retry loop before MII_CTRL1000 is read, phy9_orig is never
populated before being written back to MII_CTRL1000 during post-loop
cleanup.

Track whether MII_CTRL1000 was successfully read with a phy9_orig_set
flag and only restore MII_CTRL1000 when phy9_orig_set is true, while
keeping the existing post-loop DSP and MII_TG3_EXT_CTRL cleanup intact
when tg3_phy_write_and_check_testpat() exhausts its retries. Also
zero-initialize phy9_orig because Clang's value-insensitive
-Wconditional-uninitialized check does not correlate phy9_orig_set with
phy9_orig.

Discovered via Clang -Wconditional-uninitialized on an x86_64
allyesconfig build with AI coding assistant help. Verified by building
drivers/net/ethernet/broadcom/tg3.o with LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not runtime-tested on BCM5703/5704/5705
hardware.

Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v3:
      - Keep the post-loop DSP/MII_TG3_EXT_CTRL restore sequence intact when
        test-pattern retries are exhausted instead of returning early with the
        PHY transmitter disabled and DSP 0x8005 blocked, and drop the
        inaccurate tg3_phy_probe() claim from the commit message (Sashiko AI
        review).
      - Guard the MII_CTRL1000 writeback with phy9_orig_set.
    v2: https://lore.kernel.org/r/20261122045326.19641-1-irogers@google.com
      - Target net-next, drop the Fixes tag (Andrew Lunn), and zero-initialize
        phy9_orig.
    v1: https://lore.kernel.org/r/20261119171021.1535172-1-irogers@google.com

 drivers/net/ethernet/broadcom/tg3.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
index 95827df4cf6a..21d21fb2b016 100644
--- a/drivers/net/ethernet/broadcom/tg3.c
+++ b/drivers/net/ethernet/broadcom/tg3.c
@@ -2544,8 +2544,9 @@ static int tg3_phy_reset_chanpat(struct tg3 *tp)
 
 static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 {
-	u32 reg32, phy9_orig;
 	int retries, do_phy_reset, err;
+	bool phy9_orig_set = false;
+	u32 reg32, phy9_orig = 0;
 
 	retries = 10;
 	do_phy_reset = 1;
@@ -2571,6 +2572,7 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 		/* Set to master mode.  */
 		if (tg3_readphy(tp, MII_CTRL1000, &phy9_orig))
 			continue;
+		phy9_orig_set = true;
 
 		tg3_writephy(tp, MII_CTRL1000,
 			     CTL1000_AS_MASTER | CTL1000_ENABLE_MASTER);
@@ -2598,7 +2600,8 @@ static int tg3_phy_reset_5703_4_5(struct tg3 *tp)
 
 	tg3_phy_toggle_auxctl_smdsp(tp, false);
 
-	tg3_writephy(tp, MII_CTRL1000, phy9_orig);
+	if (phy9_orig_set)
+		tg3_writephy(tp, MII_CTRL1000, phy9_orig);
 
 	err = tg3_readphy(tp, MII_TG3_EXT_CTRL, &reg32);
 	if (err)
-- 
2.56.1.831.g720f3f5937-goog

