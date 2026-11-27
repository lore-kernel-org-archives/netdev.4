Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786855;
	b=zNMFUHdRnN0FLM/R6hO3tizdO4WfJWrdDmKaVmPR/5dkb5stCxV7TrqwMcyH+fkmAfx8
	 JeoJlc1lUn/fYGWw8G+qfq1zqkZYTR3krELpzJzMsaAfmpMeEsaqeAV0A42+qinZckDKn
	 wgMFnrnbao9/FMxULY1oCRXdcvRSWIsCzwh4oJjnWnCwK91KWsDLeJsgMoo54366LDYHI
	 DrlMhEEiKkzxPoyC6kXvDXedZrlVzCNmF0qHJpyXJZEqJQMdv73UUwcDfXsUF12iNHaui
	 HCMMwIEEotDgM8ZYyjiyqNBERoWTEqjNt6O5y1HhwmcBnKknOxKqLjliTW9Fzj+m1EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pdEAarPZNKEUfPhFhzlR8v9qpw9OvFlO1VgxWcD8/G0=;
	b=c9NUElxAO8LRdyArauYHFFeUjNh78pFvo6fSDow+ma1/TDWWiwGYS/1TeIujFt662WG1
	 BSOhvssjRKpPKjV9vXYMT2Kb612WYXQfSn0QYWjMukjxUGhkLBsRMEJ2LfzcjnKlCkY5E
	 Uzcj3ANF0sY4uJseHGy/Urze41uxReM1Asbbn4+E7Z6UPqLJhYxXOsPvw7yVlsg/Ly6xV
	 qdX9HSfk6dh7KRze2Uk+/B0MZJ1LdFNb2C2fjpv0AxOfZ0Qjw4wQoCGlOqj3copza8PRf
	 LYCTidRaupLCjDUN0eSQHHb28dQ+jZPu2wTEblH6JJ+ZrJfDlUDrvscd+UqW6ADCynw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPWTT7UM;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FE0606A329
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99FE0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPWTT7UM
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so3666431b3a.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786854; x=1796391654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdEAarPZNKEUfPhFhzlR8v9qpw9OvFlO1VgxWcD8/G0=;
        b=aPWTT7UMQOIf5lsZVeOWdCskwAJZO+4/C51339LK0ATtZ/D/z5KWJjHtV0IzyhJC3h
         HDFRk97heztJV6zVvyO8OMwjNkJb3ryNrVZ202S1X1JAE36oPzrV3dVCRI2uEP2tVVTb
         cj4HsSP0OUKDRrlQo9DGBS0DysV5pEqshdeerIojoJawkIbGxYiK9ZGFibApzjTmshRI
         DnWIhjc7E+JyXTHeo/nnnGpIdr1w0ika//Eczy0tgTiDYZ7amv1VtB+bNfLblAQHgdI2
         GJ6Qow+UCjRVXq91SyKtuRHPxriFYzAK1oYCoyoL2H5kT6GU0CsahDKtxuh/SV5tf9QG
         3VAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786854; x=1796391654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pdEAarPZNKEUfPhFhzlR8v9qpw9OvFlO1VgxWcD8/G0=;
        b=sczbhEOcRxQHfzpocgcECcpFpAbvk6bCOXyFCkFTB2/nY8Y2SoqtTyUYwS6hpon/Ok
         YWYSWtYui8SHKt2bbPC/h9zr6eKFFa25XSWMSyOupcyn4CN1R84BFFxTqn0ZnNnUZO4m
         JmrENjjp33JEPl4LJEcUOqOy4Af4Q+DPlWP3hkHLRUuX2kg9ys/F7iZEXjGHnRKuLzqc
         gLL9VUnhTM/07x69Yoy8qX51UedPcqSAzl7WxA2JY/rCB4cYo/aALEvsbwQKgTM5Mdyu
         PCyf1+e9mbe4uElNiMm8ULKxqoNjF2sgAaoti03vIWV+PixBuPk1bxC8BK08xjfOJmLS
         F9Hg==
X-Forwarded-Encrypted: i=1; AL+hErH3prdfvmbCHpCKAm+bw3MhVILim5Z3AaGIKUXcFxnAgMQE8jeLCrDkNW7OapuqURIsEfxLGUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gZkkSmXGs3mwOvRxwtsXf+u3lSBSKuc9O+RArapisXxkQVwKa
	YwrR1USf7BDnV0mv3KQDAnt+E6ixGJwC/CFyXSlODQU1KWHIZYAHW+j+
X-Gm-Gg: AZFdTZfxUiPVizcN95UvIrUhODtk7sRvUlKh4iatMVCIMinW7WNY1Av1kHdJNtJDJnR
	v8wqtUgx9BuWPCUxbmkHG0Mc7vrxvD7a+ZA1cyuFp3IsQbYJPysu1fMPi8MIGTmdc51ZYxZU4K5
	5wuVOiwpqr61zxUiT3cfMQ37eXUDEu5ymy4XUMBHq/iGM+tb3hQ4Vdj+jyqL6QqR2pBFoGTut+0
	d3iRM8HEsXFg7qnKZEV3n3KYWSRs0dr5pGhdzEc3b4FVKAmdmSZi0oZG1+IklJjqPFBW4m5X+aQ
	MpdbO9UKemu+cEGKLA/KHTqN6KeoLh3fpdnnDSnDlZOnOcSPOzAs1N6VAl90GUZQNcERxwDBJcA
	Z6Y+leY3ODkagAJfq6zRXKCoY4yfhA4AHRa5e2eb5mna8Z+ZTF48lAN71dvMSgN6qNcVuHwbhyH
	YH2lsJdUzphbFoqYyFjScmhgTMNOnKwWDOR0TrqGSTz/0KpR8n58vLqTosslbakTGpMLuJrhUTe
	q90T5/hxgpBos0eeQ9kueSQ4PmoWuZhdlJiM+meCqq5cTBZ5Hwbj53u3kRC+99SjPsXZdJ+miOP
	LH0CZPpqQ+Zd1WAOlnorcWbq4a9MIJzNkWiXocA6q54YZ3qoo/EbPiiDSzBSNKpl29Za+KyiGeh
	NGqaZjRoMfbpowWlLizJcNYfltIN/LF8ofeovlYiz9Im15riMO2n/aYZONih4SYde4WebnU76ia
	tzq5MNO5Lf8R2Ya5/GmjkGTUTrT+iOJh4jHW9fTYk=
X-Received: by 2002:a05:6a00:928c:b0:8a0:20e0:b131 with SMTP id d2e1a72fcca58-8c87bac50eamr22456811b3a.19.1795786853961;
        Fri, 27 Nov 2026 05:40:53 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-18-138-229-8.ap-southeast-1.compute.amazonaws.com. [18.138.229.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285b60csm12705838b3a.9.2026.11.27.05.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:40:53 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 5/5] nfc: preserve NCI data status error codes
Date: Fri, 27 Nov 2026 21:40:29 +0800
Message-ID: <20261127134029.1813-6-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261127134029.1813-1-luob87709@gmail.com>
References: <20261127134029.1813-1-luob87709@gmail.com>
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

nci_to_errno() returns negative errno values for nonzero data-status
bytes. Passing that value to nci_add_rx_data_frag() through a __u8
parameter truncates the signed errno into an unrelated positive value
before the completion callback receives it.

For userspace AF_NFC raw sockets, this corrupts the reported error: for
example, an NCI status error mapped to -EBUSY (-16) is truncated to
240 and negated to SO_ERROR=-240 instead of reporting EBUSY (16).

Keep the error parameter as int so the original errno reaches the
completion path and userspace unchanged.

Found by static call-chain audit and reproduced under QEMU with
virtual_ncidev and KASAN/kmemleak.

Fixes: 98ff416f97c5 ("NFC: nci: Add status byte management in case of error.")
Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
 net/nfc/nci/data.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 3bbebb9..4a2326a 100644
--- a/net/nfc/nci/data.c
+++ b/net/nfc/nci/data.c
@@ -213,13 +213,11 @@ EXPORT_SYMBOL(nci_send_data);
 
 static void nci_add_rx_data_frag(struct nci_dev *ndev,
 				 struct sk_buff *skb,
-				 __u8 pbf, __u8 conn_id, __u8 status)
+				 __u8 pbf, __u8 conn_id, int err)
 {
 	int reassembly_len;
-	int err = 0;
 
-	if (status) {
-		err = status;
+	if (err) {
 		kfree_skb(ndev->rx_data_reassembly);
 		ndev->rx_data_reassembly = NULL;
 		goto exit;
-- 
2.51.0.windows.1

