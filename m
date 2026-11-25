Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573790;
	b=bVpJaX2gzco85DCu5S12P4CCDmXcPrfGSFx2JXEGsHBsnrF2WFhSqnMFn2KXeecIVP/C
	 mndfUmwzZ2eXhCOsVRZA/ocl3V13B2w3STEhkwEZLUt6O/Iv2hV96Uj94MVpB7jM28tox
	 gu5Kfm6PjRnoPENEUKAuSUIOksv+tvKzp1Z4iTgFBr5liBFKfQnjeW8wnVg5l2YvrZbY/
	 NXrcpoCnPdvdQoxSMEFfx6BO9HRMcsSEPdmC3X+1dbT3kqwxVpVybwmE/mIBjTrchM5Z4
	 3qJbpjfzBRkuIdQwJDdvLWkt+8rsW7wRDLwqNYMyZb4zW6sc4dgnyjkU7kesl9PrzFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5yYpKRVT2piPSpwzX/oy6NpReWj0wAGbXHq7GXlOkoI=;
	b=I8LFXNpLCw8iTslauAlz+gJ5iEcFBbR+WuxFYnEfJJ0azzrVMGDVfORdOsXqY5vw1bWG
	 Z1a9sPbBqvar2icSGc7PlIZDJCIF1gqt4NvcDgWYU4tgvHoDIZyO4uV1fj3RF7gpgGTVP
	 402uWS8otZg42qVHFOVCpt8/RUC8mpx+IE+1xPEHTOmtmq89IlTIFmWIk/FjNfwlNQ94O
	 F5VbMlSGXvk/JGyTEz40sYOCF+q7SXY7QybS0dND9+iaukU862MJTLu9FnhiZWhHWUpks
	 sfzBv00LhfKFm3vlCQKmiCJrM42jU6JjBSU0vgNbKSB0Gu585E4FRErb/bbED5gKQRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iu9M4RWs;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B5606A33F
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA2B5606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iu9M4RWs
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-386c71feeeaso1462515eec.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573789; x=1796178589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5yYpKRVT2piPSpwzX/oy6NpReWj0wAGbXHq7GXlOkoI=;
        b=Iu9M4RWsRk9WdnsnZHLPXIDN0e9I/69xL9VPLjYcrrWUTueEjNSjLGzetbPnAzCcOP
         Wr6wakC2pwVuxwvMkGlIOd8pu77scMmnbrBHok6AFcK1tqURh3yHIwYjqKOmXqESRUpl
         MUhjYlCn+9a3tNyTdKdiTHQqQzqlAvqyYnStIRQrtvNqgCx4yqboih9a8H2i6Ottl1kV
         I3A8XWOQ3hncfIUY8qMEDaAuvgdYuSSLCyz/ruXFEHeNSgXCisPWiVsYMeepuB1AVWvi
         OP5YMf9hV1mqeZLhKUZXO/veRRRXaRW0zgDUPc90CQFaeYgEThRs46VskTbvq6bjMG92
         bUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573789; x=1796178589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yYpKRVT2piPSpwzX/oy6NpReWj0wAGbXHq7GXlOkoI=;
        b=Uq3e4sJeAZUdgqBmFEB/gCglH85IswN38o+tWlujP+rPE6KVwndcxi7DALTkNh62jJ
         fqv/wiQEjKTTujt6DtC3JbIYt2V6N6CDuS0WZpAiPSOz8D77rTnB1FSFzJsIP1nSlZhg
         3vAlTLbDZRj6jIEwhuJUv6ib/2o2xejV8Sw1xc38HimuclQj19BlCEDSwvvP6ywnGwaG
         aFXc32DP3WPHnj/pRUw6Zf3UGhABfN35047c4G6z6xNjZPDDXh0MnQyWvpZvvuKnJ/mg
         BQEBkdAnlNsgXeWq7g/IDbAHl66l7MEsBkjcngeANRvAII/wH0Iu7Kj2h8Mp81qz8YKD
         w3dQ==
X-Forwarded-Encrypted: i=1; AL+hErH2dxTulbQO8BNhVj/dfe4h97Ak7Vm9QFr1cS6n5p/mHcg7VhhrbUW7ZIKLxLiq1MAjnYoe2Wk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NiDBv4IPrNVpBIrClSAxVqtPwya22hico+hu09zQFYNklRUsi
	L8BJ/SvlQLzHpAT34m17ZKd9VwdA3H6y7BaXeSfg6zKcpEpwPTazgAux
X-Gm-Gg: AZFdTZf7/hQyTXbSBcu3ayLkrpropREtQaiAxfKOBb9bo6B7M/w+kAamC1NCuHfRYOM
	7JLEzH5ehy0YwM4i//9KtQ4x8chc86AYJYvXFoYeiqCJK4SSKmKZa11BfPMI77m0APRnGvH1bfp
	wipLxjIZyvaZNqsghf/Gc4ccOZZdL7I4bVQH0I87ycngf14KuSZe9oBYwih1QUK42vleFDOCLLq
	dK9l63Od1XqCgPTa8HDqANupp0nCsm8Q8wCqvJ3v6MsFBVF6OOHTqOLqHkWv/KTBeQURE/SKG2Z
	5tipdnqkGna+f/hk6k0aZ8dssVuG/ahaRmOIxDP+GhXoJ5QMuEiyZKQm80qi4mRtPAtIihnBc/1
	IfmMmcu0aX6FhWfikwTs5iXtgfksgywYIjgWGgQSYvXMCGmyFUWRDWDMrUFRuxzY+gZRH0Veoad
	+ULZ00zNRGlbIahKftj0RyCdfQamqh3zFyGPngrRTxKGN6BfAP3ZmRep/i8V+AmVyoz4mBEA0iR
	Ck67NGEwZQJAKrGYjwGLjWVVb3IYmEbBp/3X2sK5iDiKFmMCtjiDp9YTuX3k/WgHJ/+0YB4l/xs
	nYkI44qEYoUui0NyXdYq3XLXhQ==
X-Received: by 2002:a05:693c:69d4:b0:36c:a154:db1d with SMTP id 5a478bee46e88-3856c6b41eemr16943243eec.4.1795573788900;
        Tue, 24 Nov 2026 18:29:48 -0800 (PST)
Received: from ubuntu.. ([2405:201:8026:213e:e27a:f80:e9db:185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm50655698eec.6.2026.11.24.18.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:29:48 -0800 (PST)
From: mdshahid03@gmail.com
To: tariqt@nvidia.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] net/mlx4: fix error propagation in mlx4_load_one()
Date: Wed, 25 Nov 2026 07:59:13 +0530
Message-ID: <20261125022913.205366-1-mdshahid03@gmail.com>
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

From: Mohammad Shahid <mdshahid03@gmail.com>

The return value of mlx4_check_dev_cap() is not assigned to err at
two places in mlx4_load_one().

If the helper return an error ,execution jumps to err_fw,but err may
still contain zero from the previous successful operation.

Assigning the helper's return value to err ensures that the error is
correctly propagated.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/net/ethernet/mellanox/mlx4/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/main.c b/drivers/net/ethernet/mellanox/mlx4/main.c
index 036135df23bf..9d89721077c9 100644
--- a/drivers/net/ethernet/mellanox/mlx4/main.c
+++ b/drivers/net/ethernet/mellanox/mlx4/main.c
@@ -3505,7 +3505,8 @@ static int mlx4_load_one(struct pci_dev *pdev, int pci_dev_data,
 				goto err_fw;
 			}
 
-			if (mlx4_check_dev_cap(dev, dev_cap, nvfs))
+			err = mlx4_check_dev_cap(dev, dev_cap, nvfs);
+			if (err)
 				goto err_fw;
 
 			if (!(dev_cap->flags2 & MLX4_DEV_CAP_FLAG2_SYS_EQS)) {
@@ -3540,7 +3541,8 @@ static int mlx4_load_one(struct pci_dev *pdev, int pci_dev_data,
 				goto err_fw;
 			}
 
-			if (mlx4_check_dev_cap(dev, dev_cap, nvfs))
+			err = mlx4_check_dev_cap(dev, dev_cap, nvfs);
+			if (err)
 				goto err_fw;
 		}
 	}
-- 
2.43.0

