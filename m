Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675166;
	b=njFuSZFu35GQpiC59yfisr4gs7AzzZjbB3oNTqGNLU9B6tOrpiI6t10H6h0M0kWhIW0L
	 nZyEWohkUlM+IV57EQ93FOqntFThe591DDAAtCWgUq2w3mHQVoOlm2+7tSErv4Xpok+En
	 q8OaMHwo3QQNBTYMlHHAoBXoZcoYIb5t7kqdFvlT7XcPByAwIf1eruXTmqqkjM0h+Ckw5
	 7ADEd/GgVSn7/bUQ70K/OJGYhzK6a4OP2OmXP3wOe02QSMHzcZCMj3+9lSRxqJnPA/OCq
	 wTkYw7X0uhcGJBhfDehlQRlPaE+4ZY2m8Kcd3PCQkjlVF7x64BgjlUYsrUaMfI48baw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gRPsfsi93ztSCs2QSFkYBVWIi6vXulM42YvoVjjVqpE=;
	b=WM1h3kLy48KbLX4fiPBbfq4hG8QB0jajoq1Z45B4SAdZSWipJZbq9GJCKYFrSI2YlwR5
	 MwxgMcv5YrXB7XxtnNVIQbQl3TSD56hQHRI4KC76JUxU6+STCgMKRzUCqFvdNnolnzISw
	 iPv+bUCWv6j6+3jy/z2KWkc1NBM3QCBw1EsXrNkv8UsZ9V6cQPA68KspZujduDD8XDRvh
	 d7Ob2IQZcXIt2FQkyECRDVzKy+UyxV8o4u2T+yqpEOdCWJHPPcaTfuEgup0wwPbXu0DiT
	 cP6He/7CcgMbFNtzhrMYxelVs7yF630AwBXTe6Azdrb+f2B7/GBmSc5x0Xp6k12JFEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JPMBfTF7;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEB1606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DEB1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JPMBfTF7
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4266889eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675165; x=1796279965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRPsfsi93ztSCs2QSFkYBVWIi6vXulM42YvoVjjVqpE=;
        b=JPMBfTF726268NhfprvDI98BW7pD2A52FBjtdFqCxE4mQJGQpC1Ma9uScajoKPn+DD
         HIHYF8a328biIV0ACuYxOQGYu3FfBmdT5iBdjmgb26opMECZOsZRWs4M88GCQ8jtXDyF
         t7/RGiNnQnyjbEhpJQBa9IO0ZZfzCZHITdx+3Mtsel58nt0fV6eUpOGYcecZz9X06Rgj
         HIYdzWLtMFoDnazMaAVEXTLT/4fHqUwSa91eX4vEulgoy5390s/Xrb65dwI9WdW/2Ij4
         3LDZlodu4aPCXY5PKzUz/MtfZyX8TEKsjVBabyEeox+S27wmGn32IlH987LLBd9H+AOS
         6wVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675165; x=1796279965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gRPsfsi93ztSCs2QSFkYBVWIi6vXulM42YvoVjjVqpE=;
        b=CEPOokaFGqKn4Ds99uZvnPcXE354oyFg/xaUZjrSSv5PsgeoFJ/lpxZjGjLiQL12/k
         ti/kpQMT8sykNPeocml5vvlQMukY9KY/sb86zXtMZlNys7VUtMD/1Kf1Uxc1fvTdwov2
         NQhWW2QbsnXP77nApZHz75Viy7Gofq9y7ZQGFy5WGTNAvQpjIOvmfd9n1xkYlxm4bgmP
         QpU2KkL3OgcGZFiKEV7wLTRP0EQiFBBEj5e6HOmY2bv8RBsQrwcZWd1scPwyyMGhy7ic
         /uGmfbHxnXhE+/fp+XbMdnQDGTjEvfkqSEhoWUIUNqSNtpPK42ma+o4FwacqSyAUsy5k
         N/Jg==
X-Forwarded-Encrypted: i=1; AL+hErH1IUtBtKCYu3HzfZbL2Zpzb5iEAUe4eH3P4TXP4RWpN9iUKh7d/qacu9+GsmO/DtWqRDlc8j8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6aiLah4pQiSA1quaXDp6XFB2pJykJksmf/V/v3JbMs6u5t5IT
	LGvsphhkjtGl9q0UnYYdzHDJyYq39DFLkMS6KJZ8B4KAT+DKtIwAhMFU
X-Gm-Gg: AZFdTZcLHqbsR5sAafLHAcu/2Gf/ejvazvg+8MLFkoObkZ9GDKPmaanvPVOgt5Cl0+4
	UcBFOD3V9bTLatrSgi9MTRb7p6yZ2Tp+87oJEixN4ElDabLvjT+ZMutrN0U1Oy/iJEV6rEtdoSB
	lIqon63SzkaoQ7K73HNZvmrGwvEqOO1qiyUASy3p5Z1xfOvmPXxllnymWqRq0p7oh8P68ca2/WZ
	GDpspge8tcyZ82Abm8X3YjVTrQzyTctvGj++LyMNVh3TF5BMZVhFcBMq6Lcr8IREjBXNOhPocZD
	NhMSyVh5zBPGH7aoRJFf5eL0JYaHoFz2e2o1i5O+dug95V0/C4WLuSiTIKI4y48tSrIeNToXBvM
	r7BWXZhytjfBvPJjo6N56loq4i0+PALjuzo6BIOXQhPdqijb0Sn0p6EC+1HyFkX+zIOCjcZDE2G
	5BEhuD5orVmR0z6dbGcFAertGttNRkfHI+L+ETH+ulZSOMggj/Ycwgs91pyHKAUdazOCuS/ZHff
	7DmwIUoDUIgJEc1+nFA+0yIps8PJOVRSPcSQjuHBT2TSwSmtwgz9UMIFw8eGabq7xG1OvhBmS5S
	wSViPfNdeHcn+PFRMSB3yuTvRgpQFjSOnDPJ5HSMmjhHkMmnnMHqr5SJZp0A0FYbUjj4csuhQUg
	PzFh4PcPQRzI71Y6H6YTxfnzC53SPLgtXebFbokBma/7MA7th8pBJkuTQks91XTs8DJczkDIpAp
	Tb6ei75hIaB7weTkrM8nSUH9VKZYM7Sv5waCwylNTq
X-Received: by 2002:a05:693c:41cb:10b0:386:cef4:1ffc with SMTP id 5a478bee46e88-386cef43e87mr4363755eec.12.1795675165132;
        Wed, 25 Nov 2026 22:39:25 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm55404015eec.13.2026.11.25.22.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:39:24 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4 2/2] nfc: preserve NCI data status error codes
Date: Thu, 26 Nov 2026 14:39:11 +0800
Message-ID: <20261126063911.353-3-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261126063911.353-1-luob87709@gmail.com>
References: <20261126063911.353-1-luob87709@gmail.com>
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
2.43.0

