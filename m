Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415608;
	b=psh1VA7TS81haHJKfVTwFoBN2BI2xIOmxu1HfNCNsg6apkJepK0B6k9b8IoSVlNWzcuF
	 QXq1iIgdJ58oDnd5di6lkx84cOzyCWkr+b8pjKM9WTp3GuXpva3INJ8A3PJplDiCk6J2Q
	 GM9J3uKuyoVXZt4Uayqce/5sRcuN9aba5u++RjRKGgg7zvWbHQ0zkVxOY8RY5nelGmKqR
	 dNGBHAYLikCOvmuPA85Vab5r9ouxCKyDPxtHlTrPB6FaQbMVe6loJ6IG/TSfnu/pdZlkU
	 Lj1g6YV8phIaOeeUOQFK3eD6Yvnl7jwTakCgk8R9mhnxD7+U2oAvuRdyR1n7Xv0yiuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415608;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6mnZfOSkxDepY2i0f378cTykfqpzL6KhJuIK0Wt6zEk=;
	b=htyXWS1DE3ANUK7xt9yvb0UPpZn7lJVvoj/1C6JHkAdBlxwmrHVl2Vbo4tAH74sW5W5q
	 QXCroEWZIUFt8v5K/e/sDSl8SdXy4zW36dBHvTD8PQ0Qftm4YD2A83tiAln9rGmB+fu8w
	 hGd/1zJgjo02xc2waue7irydBKgEfv/Pax3ySMmoe3jvARP3mS6zT3URcgzsUo0zv6tix
	 YA2xFku8t8QO5XZsc2QbJ7e7+x1+gTPpk9BrgvXaSZtrb8i/0wT4VnI+R6u9CcnxnTNzJ
	 b1po4tHgDJB9T59jw0EFKhxT1F/Ep/H1iEz36lVTyWn3tzFO/eEFEGPy3GX9J9uw7CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HCml0ifA;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E366E606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 06:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E366E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HCml0ifA
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3869f03af6aso1985443eec.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 22:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795415607; x=1796020407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mnZfOSkxDepY2i0f378cTykfqpzL6KhJuIK0Wt6zEk=;
        b=HCml0ifAVoC04DR1qnxQJbTTPprsXumYeYTXKrUoG4N8+iSNYLroWnc1AN+0Sj/F8+
         v1Wn1GBig8CYi28Z9Tpfy3xtKZzxIDr088Y0eZmF27zIIZ5PJGq8FnBO/01J2FIrl6kl
         HTusLSf7gNIy2WYltMMZxsoTabhVwbE7F68vhV+cYFfyhxWXfrA4A0ZiSr8r+sXao5CA
         oLi4SJXu2RCAa6mwmEXRBB8rrrEqbhafqRhyhuZG9MRzjE63BEVtpvyHQJwhuLacw9pN
         k5HHpbTDF3SiWhBq+BvHkLvHY8Rc2Vn6EQXUcHi9HHFS0gqsRGYmceXvf81w2TK1WOVs
         ZdSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415607; x=1796020407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mnZfOSkxDepY2i0f378cTykfqpzL6KhJuIK0Wt6zEk=;
        b=2Xd6xESAAp9P6kCn5AbQv73PrWzfN2oWlJzc3uEl3zIVuajiFxiu/4Hsig7CnCPNL9
         tgqCyex4Izmou6h+4ZO7L+UMH1PajWhnySEQVwID1bsJ7rTfFakRHe7GLlOKJ0VamezJ
         gzGuHMNTnwq6CcflRjIYJSIrOmAghyrQ0d95S0JTeZGdybZuT0XULmx0xdVyes5BJx3e
         CgB2FzFOrABviPWcyXGlEANsqGQatHiCZ0OilNsnzU7VsDai3BOa4YwyiVeQFOaHBYcv
         mOjiIhObqrD3YoTwJrOdYmdtZ5e41OtNHJarPgfd06Guuuwj8eRZK+Tc7Lzedgu93L0B
         4EqA==
X-Forwarded-Encrypted: i=1; AL+hErFuYLbYD7NyiA6tWDw3o45matDkfwFSzFxW1SCzja053fv1shFk2s3dmMWx4IBG6lZ7rzQ0tAs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G2UCXcKDy49qBrc3oW6jxUs6C3/ZOHm1fqhhX0MVafvuYqRoU
	zovf4RV2eqqESt9AAd7dVBKOiYQzVfSigpSm0jMmIU85+OxeNpeCSwkv
X-Gm-Gg: AZFdTZd/d0hlhJhhVs5baBUWuO/v1bX0/DWDvz5RMepxmeOPZAjZrRE0g/SuScldzLA
	SoAbqG5UjFr4rKdnLuqw0g9Blrn2FMt/EJyPnLZc0FnvY1lq5an7F0Z6wkzUJ2bGqB++VB3QVZl
	z6B1BzIeheZGpBrH3xS71ZHypbLvApiMFvjIjTP6wgC6YJ47buIwUvQktJPLK9+6A4GciGevlyV
	FUvc3HIJDJqndS24B7tuFE6JZokPHX4thS3DggCJ3YtT6et3JZJPUnJnvefXHrJhAdxQMyg6GWe
	b6aCEj/4A1By/5uugy8RXUmcjXptvSOghQlb1v5am2RVS3FVGTfa8plR9dQNku7t+9EKEcULlhj
	0V3rm3dpmOB8LUfEvvZU4Ws40DPkko6VkskTs5YaAHIsO2RDTOSvqRuLFHzRjJo83MC6GprIUxV
	ziiErawE5/6Mv3V1IlJ0zaXmG3y/pcEObi4E3xr7gP4HevZ40beTi4xNmL3DZwjNOtHiUQ74f/x
	A8kk4adNugdWu3G/WyAkBpauP3TjPY3k+6V5tlzc9xU67or/n07NU0hOgenz/HgFDz5wOu0vooO
	a8GCSERkz/xbOSdZ5i6k1Z9AiMCdGBl+9MqbfblJIYlzTnehWj2PsCFMWgUzzG8CtKw2TGhaS/n
	jffJ62/b4weVFmBNNQpHUqeau6YHw6/ENsTYqiK1oOe93dLqoCzYJEwFpvPn5ByoQ3rFsbqi6uO
	PNWQI+yynim3VbQhqiSmgB/XmUlqOV6D/CrwmkgRpReG0nXwVYkcxTpIkOcBjHiTnl
X-Received: by 2002:a05:693c:68dc:b0:384:244b:12ed with SMTP id 5a478bee46e88-384b11ec95amr13052915eec.3.1795415606797;
        Sun, 22 Nov 2026 22:33:26 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-47-129-70-252.ap-southeast-1.compute.amazonaws.com. [47.129.70.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm35452817eec.24.2026.11.22.22.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:33:26 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	"Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] nfc: preserve NCI data status error codes
Date: Mon, 23 Nov 2026 14:33:10 +0800
Message-ID: <20261123063310.1267-3-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20261123063310.1267-1-luob87709@gmail.com>
References: <20261123063310.1267-1-luob87709@gmail.com>
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
parameter truncates the errno and changes it to an unrelated positive
value before the completion callback receives it.

Keep the error parameter as int so the original errno reaches the
completion path unchanged.

Fixes: 98ff416f97c5 ("NFC: nci: Add status byte management in case of error.")

Cc: stable@vger.kernel.org
Signed-off-by: Bin Luo (University of Electronic Science and Technology of China) <luob87709@gmail.com>
---
v3:
- Split the signed NCI status errno correction into a separate patch.

 net/nfc/nci/data.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/net/nfc/nci/data.c b/net/nfc/nci/data.c
index 3bbebb950..4a2326a33 100644
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
