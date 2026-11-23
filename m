Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401296;
	b=FNmd6SPipY6Ex3Wyg2+4yyqIKixjjwRGXQd8gdkls8KZx/e3e+1+oKQYT5726UG8l7CA
	 k4otsbLsnrhaY1VIcEJLw00BYidLWkPqtW/ub7kuzanBUuNwut+GVMEvV9Qag1WWH/FdM
	 lgOJADIBAAtz4aGKepx3UGhRd96ZAshJDg9k39Q9mMkYVql43kP35tne4fAyHdrNYcWW+
	 T9X/EWnz050odF4E1FIIR8E+f1hGNPspoA03Y5ReQ2x3pHWmDreHiHxO+kMo00oNT7XiR
	 CwuT6iTRUprPESUhYLoikrPCQFj+LgWNLDfRfWLFdI4mWYdGAaJAeY9PbIZaEbQgLdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MKus0ZIpKMYnifwBN/xjucnEiMSY0/cmG61Pf4wmF+A=;
	b=pEuuRhQL8SZz42J3Ar5tK6X91qNuCNJWQTT5bL7Yi/BWbBmTK0XuUplXT4HzWz5O6ppM
	 x+AO6JSSP956zZmfivCoGOGMcNdRiOlJCcGA3+20wxTMLXM7JsDau1BLRZlCAGx1JOxvx
	 JrGnerBTGh74H7bW8aILnHw/LUMKs9d5zI5wmm39N+7LLb2kSkbsHfzl5rSvx5u48E8xQ
	 DgPE8mrFPtC43ueVGFY6z/iz0QK6VxByVkKyO43xU0/c/0gas+1+KYsQ16wRVj0Vt3ZoD
	 VDCEmadVE9RuhybaZBrwqJEsK6+V0eas+T26xuWOIVUdqJexxK1ibBsomv5KE+dWcFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Y0hfpd5q;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47311606A32C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47311606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Y0hfpd5q
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f052ae3c86so12583905ad.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401295; x=1796006095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKus0ZIpKMYnifwBN/xjucnEiMSY0/cmG61Pf4wmF+A=;
        b=Y0hfpd5qTRrb+3rpAV23+M/RWWOEhKBFAs2X7rrkgPuRqB7wvs9tZmjNt6tNIaGP65
         urbu9vK7cwJsSsT3sn7VyaD4BSB7DwtlAKF+2oGJ3i83jwvZEi064o/1mYpaV9ux098k
         ia0Pw7FMerKQr4SVo59OV07X2HlJ2WGG2NYOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401295; x=1796006095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKus0ZIpKMYnifwBN/xjucnEiMSY0/cmG61Pf4wmF+A=;
        b=hKl15PiTVs+URyNMnrzkoZamva85HR4uXVpeQEiyJkz/83iXHxXlZo4RwQVR4n/+Gb
         W2Pz5OjPbcdOlggKqo6649IESOaYcOpcxebJI7LUFwhi9OVae1sQPrpzGTu1lOJdhvan
         CzCuYIrQKTPVin/+4hzbiVTKY88GM7bP2wLF933wxUT62qQRGtoMj6neHmmz+KACKkAL
         4UUs6wUmcnza2dkIQROdqa34ZNVkzK/wKUzSCEtxSwcQlSJbwT+NptQiIDKZ+6VPmWQs
         w8LXGqhrm0tddn3d0piJxeaWwkjH/ZiexVq5S4NQkSthNX8+QcVWxPuN3UeAHoGUUnsh
         TOpQ==
X-Forwarded-Encrypted: i=1; AL+hErGQw4U4GGnIjyp70MP9gjV61n/QRUuIsw4H+drIJBkxa2zuFLS/wb9sgiG2lQDBIYfFG2ZxkoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9a4foz/MU7p8zKFspd4a76ilQD7inFoQ+Vrlnj+qCRX4qpWnpH
	QwsSAn/re5E+N4VZ5zAxSUn2+b74NudoW/Ug1fOa69pG30eljWIqiczmp0zDhLkpU4o=
X-Gm-Gg: AZFdTZcSWqBIoFwbdCfKvutsQ81cWzlBXPxGjzfdcHPhzqoTOP/vYv9iiQMYgWLApcR
	L7kMcwWKrGuRzoOQ7+Q9eTnqrUO5Pg77VrRnWznPSHyQIXBpcSE4M261pxRJBQX5EN6zoUko1GA
	KvSWIwZ6s2HQKLZfX8KUW7KaceE3GFJUdJ2ZwjzYHkYt/9NfBzOtd8foG+7HUK6MzqesmFc9XlB
	+kQb4hpboU4gqzVCiKn4Furk2KsHYZC2RdQs1AGU7YQTjeBgg293BsBlm6PKCQbPcLFEpW1cAnk
	PcDU1MmSoos1U581HdEizFPWq7Zn1pnQM92uXZ1WqgogplUJiVgiCcaM+DQU8vYbmuVwQl7yo1s
	65R4ZW0Y96cXXF/QU1L8ErbhnM+kkOu1sMIkb5098Fda7ptVQUeMY7ev0+5XXGGy39+JTUK7PDi
	EmrgXtwuFNU71jobsBx4B91FIRuRkEqigJDy+GpG6BQZ1dYkkRdvGmyTs2b5UFauXdrkQHa9n7h
	PwWjVOPbELoapEr28lirjmOIA5DNt+uHetOsFimAImmXOChGUe6X/LYgHYkr9YsQ/wAAP1aQKkP
	sfOqF9OOKUMyvfnRJ/sndbli03aOZTuZOdpeo5MDYqZ7o0NaNBz5Y/sS3E1gioIFhQe/d7vGjkE
	3q5M/y0uDI4j2IBfovd72cLtpTnkN/abWlDMj0osZ1Djx2J/rOfjK9iTX5Gvg2R2U
X-Received: by 2002:a17:902:e803:b0:2ef:ea94:e04c with SMTP id d9443c01a7336-2f03ef3d413mr102290175ad.3.1795401294648;
        Sun, 22 Nov 2026 18:34:54 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84027sm44590425ad.7.2026.11.22.18.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:34:54 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net 3/3] net/nfc: nci: do not hand a NULL skb to the nfc core
Date: Mon, 23 Nov 2026 08:04:46 +0530
Message-Id: <20261123023446.3350387-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123023446.3350387-1-piyus@iiitd.ac.in>
References: <20261123023446.3350387-1-piyus@iiitd.ac.in>
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

nci_add_rx_data_frag() frees the skb and clears the local pointer when it
cannot make room for the data accumulated so far, then falls through to the
exit path shared with the success case:

		if (skb_cow_head(skb, reassembly_len)) {
			pr_err("error adding room for accumulated rx data\n");

			kfree_skb(skb);
			skb = NULL;
			...
			err = -ENOMEM;
			goto exit;
		}
	...
exit:
	if (ndev->nfc_dev->rf_mode == NFC_RF_TARGET) {
		/* Data received in Target mode, forward to nfc core */
		err = nfc_tm_data_received(ndev->nfc_dev, skb);

In target mode that NULL reaches nfc_llcp_data_received(), whose own NULL
test is on the LLCP local and not on the skb, and __nfc_llcp_recv() then
dereferences it in pskb_may_pull():

  BUG: KASAN: null-ptr-deref in nfc_llcp_data_received
  Read of size 4 at addr 0000000000000070 by task kworker/u8:0/13
   skb_headlen
   pskb_may_pull_reason
   pskb_may_pull
   __nfc_llcp_recv
   nfc_llcp_data_received
   nfc_tm_data_received

Test the skb before forwarding it.  The other branch,
nci_data_exchange_complete(), already accepts a NULL skb and reports the
error to the pending data exchange, so only the target-mode call needs it -
and returning early instead would leave that exchange uncompleted.

A peer reaches the failing branch by growing the reassembly with PBF_CONT
fragments until the GFP_ATOMIC head expansion for the accumulated length
cannot be satisfied.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was then checked by hand against the code, the fault was
reproduced
on net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary NFC LLCP traffic unaffected.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/nfc/nci/data.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 4253edea5..d7597fbd2 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -258,10 +258,17 @@ static void nci_add_rx_data_frag(struct nci_dev *ndev,
 
 exit:
 	if (ndev->nfc_dev->rf_mode == NFC_RF_TARGET) {
-		/* Data received in Target mode, forward to nfc core */
-		err = nfc_tm_data_received(ndev->nfc_dev, skb);
-		if (err)
-			pr_err("unable to handle received data\n");
+		/*
+		 * Data received in Target mode, forward to nfc core.  skb is
+		 * NULL when the reassembly above could not make room for the
+		 * accumulated data; there is nothing left to forward and the
+		 * core would dereference it.
+		 */
+		if (skb) {
+			err = nfc_tm_data_received(ndev->nfc_dev, skb);
+			if (err)
+				pr_err("unable to handle received data\n");
+		}
 	} else {
 		nci_data_exchange_complete(ndev, skb, conn_id, err);
 	}
-- 
2.34.1

