Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795051633;
	b=v/KS4rOlJgdKwe/wAc6wSr/ibEPbSFKQNeLRSUVHfj5aVpIEYanAcIsH1RYHtLWiKxbW
	 m8AcWDiKes/5uDdaybKVd/Rvo3Zx2cqeNawNkuZ0fxGA9O/Cr89BBPUHNPHF5jmPSYJSZ
	 +1re6S+K8FGMPgrWtX3200dTb46qufnZhmejRf6LKm4cbSt4b7rn9KWWLa3j2vkfh5QuD
	 3QUDugZX7JuxZiHnRyeysI1vGswWSy3JcX3gCcy95sXx7qbgx5DOuaqCLG4DqoyKWg2XZ
	 /Wxz3DYDzDn60g9bg5uqe8LBNHHTdcb94Q+LQzTkwZztiZbmHxrxVOqAfWuq1pkBHWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795051633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wMPR2OAqKd8NTkv9afi4XE21M7DTJCxQ1aj05lm6jLA=;
	b=jiEMjMVICQKS494m5uHn6I3Mah6iCqKEzLzZud9gEbrxpCxRIUNF1JHFEIhUopry3F9W
	 enmql/CZJt8k4Sj6G1gW8ODlb/WHITpqrWQJvjYUnBymojZZ3TUzbaSqr8GcTo3S6MHTN
	 MbTMM1+2PzJ9SsU/y0ajR+H1IrpMr4nST1yY8TxaEcGPuzo86qE1r4UNXg1NnLop8ESeb
	 BTnkSMby0QzdKrtcrG+lpk9OUani0bucmS6jwdOy8VJtQKCbwGQC039tsAThJVatbGWJp
	 nhajN+Z8gUwS5nL3wQwIlEbdwBL2xw0H2PZtSn5W6gFrS78xPHl5GJP8yqIqzRUsh3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dnBigy5L;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53236606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53236606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dnBigy5L
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-94960131b30so191890685a.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 17:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795051631; x=1795656431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wMPR2OAqKd8NTkv9afi4XE21M7DTJCxQ1aj05lm6jLA=;
        b=dnBigy5LCe3PKsBq23e+tzlO8XsZwaQCApUPD1wD4F6K6Q5XNb5RCm9PkGUqNAq275
         kDRAPaS8Z1ouYJH9Gi/DA/vAdNWLSBfwtrt+ZcCHcPqbjR4l/m4lvpjbg0MdRqkR3IXY
         3gEPFuzpldVtV54oxUxL7CZ0fg0cay7mfcrBcfxJK57/bOcwe1Y6UNEu4npiVjwc4h31
         uqZLBnbePKmptJZk9mv4MKFVJQLET8BnkaroIthf7S0Uv3tDvqCHPH1pEP7okI7CXY45
         lvJf3xvwTroXbIm5BtDjmNOqsqIJP6JWA1cfQDm4OOL/Qm5Gc05pIlE3dUKtBVISQA3+
         Zuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795051631; x=1795656431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wMPR2OAqKd8NTkv9afi4XE21M7DTJCxQ1aj05lm6jLA=;
        b=NL9sE8wuYfs/wDUiSJGGy7STBDcsIgbbVWQ1sV/pB2Sp9ucNlR0IxbVmaCN4+t71W1
         x8n+a/yEGIyBDHlOVQk1YZs61nQfGsoFIaCnQjmV0SmFl2TTh5NkeVjog0MLkGvoBey6
         hOwt2ol0UPidSzrP4GhG5ZQcQ1UzMOavCCwEivWmosaIlm/Oqj8/6vbQoFtMyqMzqiRP
         vFenTtjJNFohNhHekSkRYRmBhDNCPyijIqzGUMxynFq1bYu82lCJhYboo3EGYlvaY2zB
         XVvtCHqw6PD3UpyKwKw/buzVd6kOfkWzhlLghC8fjTT8UxG3Ob/wyqHcpIy8tdzGTcat
         hf1g==
X-Forwarded-Encrypted: i=1; AL+hErHRI+POp5DRSPGHa6vp8lMjL4owAp+1PP0cYns1PEd30BFGiAOqzdlllRgn7fWGYxmbkao7bX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ph7JosaqWxMJ4wJxnzndOFoQUy8R2evMhgNbP474D2DO9XwUV
	eQoSUxHX7ylYx+4TZaHS9woDKdSlswLnkBDIAP7IP+O9sOqJfUbd+m2K
X-Gm-Gg: AYBFou3N09VqM9Ty3/6mk5HkurBzaa37nbyGXuF4URHJuGdEDKecaWQVoK9HjNXsPOj
	9JraogsgQHLCVeCCtEIkB7S5Sg69CzvuOoARhgZ8UMEbKS1EVwgWACewpcC8sC1ROhtvobOtSQz
	lJBY9PazSBKZd4f0lSktvsjN4NEHYeEEvgkjEv6ks8agDN6PWnz15/IjdpXnf1l24zVPWegdpM9
	qATcNsNnw15EQ4TjcfeC+8CPG7JqaBKaHA9NEcpQhD757mIMPA/0wNhY52/rbWEcEb/1yLLvovo
	oxBZWI/rpKuPfs/v/qnoTKYpJx07slv3hJAds4HncvMdMiu2EdFUS7wX9TvyWQMfeevIJQENWBj
	/aJCGWd3mbd8THy7bjfafyqe7yznAFNx6p8PhC+CFwCd46l/frroTN/3hGpLRu7ct2KCuD/ui10
	dSUP0Q2UWnmfdoHOSsIGEceIAjikciy9M+APSgyKz48FWqL9n6z0CR2DzclV9yusZt436DrAlWp
	/nEPwPtzYc+lJALi4mCugnIpZbbh7j7w05mFs6tZ88zfECNtPc3ZZ7F2qCiD6iRs/ztlSkYEjF4
	SIwlkyC9PM+NI9CUFKWJMgY6IS2eTgZAdMxBGYqFuGqIvwfKJzXFkO739IeHQ2I5kpYCg6v6aDw
	=
X-Received: by 2002:a05:620a:2709:b0:93e:920c:c00e with SMTP id af79cd13be357-9499957ea71mr827141385a.21.1795051631052;
        Wed, 18 Nov 2026 17:27:11 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b4524c3sm318730885a.1.2026.11.18.17.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 17:27:10 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Gal Pressman <gal@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net] net/mlx5e: Skip hairpin entries not ready in debugfs dump
Date: Wed, 18 Nov 2026 20:27:07 -0500
Message-ID: <20261119012707.555494-1-lcy8047@gmail.com>
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

Hairpin entries are added to the table before creation completes.
Reading hairpin_table_dump can therefore dereference a NULL pointer
while creation is in progress, or an error pointer if creation fails.

Skip entries that are still being created or whose creation failed.

Fixes: 0e414518d6d8 ("net/mlx5e: Add hairpin debugfs files")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MLX5_CORE_EN,
MLX5_ESWITCH, MLX5_CLS_ACT and W=1.

 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 1d35c97aea0b..c6623f13261b 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -1067,12 +1067,15 @@ static int debugfs_hairpin_table_dump_show(struct seq_file *file, void *priv)
 	u32 bkt;
 
 	mutex_lock(&tc->hairpin_tbl_lock);
-	hash_for_each(tc->hairpin_tbl, bkt, hpe, hairpin_hlist)
+	hash_for_each(tc->hairpin_tbl, bkt, hpe, hairpin_hlist) {
+		if (!completion_done(&hpe->res_ready) || IS_ERR(hpe->hp))
+			continue;
 		seq_printf(file,
 			   "Hairpin peer_vhca_id %u prio %u refcnt %u num_channels %u num_packets %lu\n",
 			   hpe->peer_vhca_id, hpe->prio,
 			   refcount_read(&hpe->refcnt), hpe->hp->num_channels,
 			   BIT(hpe->hp->log_num_packets));
+	}
 	mutex_unlock(&tc->hairpin_tbl_lock);
 
 	return 0;

base-commit: 342e62fd34c2674e82bffc89cb5c7091924986d9
-- 
2.43.0

