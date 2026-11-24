Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560672;
	b=t/9j6pwjN9pI8Jwx4YYYrBsEsehm0MxklZvGdvr9/v3KUFbl+j0cKe8m8P3uP0OCcbN/
	 AsqNAD8hfztzypaZLK9x8KFlt9S3P1Qd2QJ+v1w4hORTH2dfMZrZ7NlCngbLlJr4mdovS
	 wzziF7Ws8Y7Ci+fMOrgPIwQ0uhoCe1idYTbWhjrqob548KLT1NHz5RZdzR2aPunNjBVro
	 rZ+tLyOd7m+6RyNdIJOdxkd4GQNPKgnhdQn1OUspZkTxqUnkzFU4sKVgrDVD98mSTDaKq
	 RI8+p2nqQL57UcKOs7ZBAP1ak3wGZeVleNzplHN+ziZZ8HQo30ChmeJifZOdQ2liyVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=liov99GJPDwRp7LfHV3OU/QCtwG0K/vL8qG58IkGVsE=;
	b=BeNOInIpI4iVv5kBl1hkbAI3W7dwqRnGxh2vK2nyMC2KCwPBkiNy664LGcpwUDmbvj+j
	 AbxUx5zTK2122gLmQKVFox9xbP4su0+ZoJQ0BOw1G7xKaWgG87IZ6Wkba35lKfuD54KTy
	 T4koy7uSDCWEvV9L7iUrDgG5+tVGYR0KCGncGcTTqqPM/wPwuh3W5a8LwS81ZB+u0aCkO
	 dZY1+dOKLOTSp4Xd9O9iLHO3ihOY+7uVDn9SYB+Osl0KKamDT1SuR7ADzBMmdW/0WNGXw
	 AP3FWaTzmwgCJrXz/6+97ciJA6iQa1BxJZ/U/aOS+Vyip6A0k8OLzMZ6f+ZvPNJ5aCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c7CCnyK8;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B377A606A69E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B377A606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c7CCnyK8
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so47007695e9.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560670; x=1796165470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=liov99GJPDwRp7LfHV3OU/QCtwG0K/vL8qG58IkGVsE=;
        b=c7CCnyK8URyZ9d10mCgzJpitaKd/+AjqVzwHrg5k51Vx9aWB+J/Ux9cNLFtfPYcnbQ
         Gid+Ipfb+j/Wp5m2fAgCoGN6OPnVS+N3Ft7w1GeZ/zICiIMte/cRknVcxiuoMMQ4dpqE
         i1iDRNZsV9jVs5BbJJaq1mcTuZ/3K1jGXIe+v2agmaiFiDCGhTNqRzKRr14MkTdTBJ3r
         l+n5Ip1fcds/4evknI73/99/exlvJiOV1O/GfJQ+MqsQ09CkSO51OmKGyXW21k7EOw2Q
         j6T8Zk29kZaV9y591HUMDnQUD+jJDdry9jfzSW8SLM6LrNHQDnZ9gweXI3h4YPJMpzKv
         a/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560670; x=1796165470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=liov99GJPDwRp7LfHV3OU/QCtwG0K/vL8qG58IkGVsE=;
        b=zkdZB4NcVBB2jMiJw8tWgxy4iev/yudXvuUnouOdxMP5Vdq8xBhBTUdg4c1UZ6yiWo
         61Y9r5PXDlxWudL8Bpp8lcgF6L+WwhxLcdbOORC4V1g9HVAzhLIvWkuPpBras4Z7dsG7
         tLaCSOYEU72IRtgcjIaw/FufH2peIwlpgRdpADUQ4xli2NfoMz58PMPBkSHjn36itTUP
         ABg/3kDoqGot++aJGpP8bImlp4mC5U5ocaV6EBMx3Cu9XiZmlG/qYlNOBVT7+xmPO8RO
         OGRpgfPkeP94uF16kd/7hmu/bn0MIlCaarwGqU/zuKEsxebP8FvELQjjsvqr/p9leDmG
         7Afg==
X-Forwarded-Encrypted: i=1; AL+hErHno2etyt9vabjv9Yiq9qmuAwcsjyXccWMSUS1+JHo7mNI0tqcZ9PJhTnqyl+5EKpDlh0PCLFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FP5LAEOWhRIF3qzE0MGnobo2R8AhBROQb2RSXbeW2heg8ztbp
	4c8X5Pf4Oo8i9c0deIIa/yu/7y5cXKAGte2Liul01e8ygS5lNUghtJE=
X-Gm-Gg: AZFdTZenZ4vZeOp4FcijbgSxzpluTSdUAcjd/7gDwDvNQXJh7yoTB5Qd8GiFjGfFbfO
	rNHJN2WEb03e5uVX4zVu+Knc6BG3zFdTeJG9ALBeJFWsfXXnc3lFMAI16AzBS2TWYp0aA+m8rYl
	vyeAqLEpNBJ+GcaO8B9W2leUog04n1c3vDP0bj2cVF9QI/8Q7RhA0k8BhjPXUFSRGLIoqQFqTVc
	5N8gBNPApnKx1yujbx3FEcnw+5/f6kI2VWgkTKNfEIUvoNDmAr4YvlkMFKeT3kqbm34Ux0rzP79
	t7zSlk5TCClYbclFcgBMdJ3puW/KHXKg2IfhIwhsvkchsVPZwpOMpuY3JHLZHTHFSwFC6UNKDj1
	INKeLG+49PiI+1uJ7CNCfi9L0k3rgmF+FxL9PdpZSC319pDfB4Gi4pBN6EPFFDyGjfDJpVXuEmN
	fa7KtmeJM9y42vehWSiH9I6OeskwylJeSJDWIM975oHrHmc07WcqZwHHMPWerls+8RmGUYVPW15
	J2lUpd7I2zOojXoRWIMLthfLL30Ag9oF/tOu/fejbzGrDKGfUpPENlD+C1CYphe/CuhVZdJbaIm
	RP5Bvj0vOrVF73X6LVSRmboEM3+FwIjFiQ2aVTakxaIGULP8pWT0DROA13gWa7kUhgpSwk3oSrO
	16jS/s883Ft0e0eBgSHZd5gtkafNJma8mADEeFsvs92QYyz64+m+SkfayV4j5Zmqqff7cnIq/b2
	17vhk26n84yOUuTtp/tuWO1Ht+Ccvn3SbO
X-Received: by 2002:a05:600c:8b11:b0:4a1:df52:3e36 with SMTP id 5b1f17b1804b1-4bb8881d194mr335283135e9.27.1795560670058;
        Tue, 24 Nov 2026 14:51:10 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2ec1-8a00-a10d-4335-1e05-e7ae.310.pool.telefonica.de. [2a02:3100:2ec1:8a00:a10d:4335:1e05:e7ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm393839525e9.9.2026.11.24.14.51.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:51:09 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Tobias Philipp <tphilipp@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 3/4] bpf: Align devmap values to 8 bytes
Date: Tue, 24 Nov 2026 23:50:54 +0100
Message-ID: <20261124225055.87344-4-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124225055.87344-1-tphilipp@gmail.com>
References: <20261124225055.87344-1-tphilipp@gmail.com>
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

dev_map_lookup_elem() and dev_map_hash_lookup_elem() return &obj->val
as the map value. In struct bpf_dtab_netdev, val follows
"unsigned int idx" and is at offset 52 on 64-bit and 28 on 32-bit
architectures, so it is only 4-byte aligned.

devmap is read-only for BPF programs, but the verifier assumes that map
values are 8-byte aligned and accepts a 64-bit load-acquire at offset 0
of a struct bpf_devmap_val value on 64-bit architectures. The arm64 JIT
emits LDAR for it, which raises an alignment fault on a misaligned
address. FEAT_LSE2 does not change that, because Linux does not set
SCTLR_EL1.nAA. The fault is not fixed up.

Mark val as __aligned(8). On 64-bit it moves to offset 56 and the size
of struct bpf_dtab_netdev stays 64 bytes. On 32-bit the verifier
rejects 64-bit load-acquire, so the misaligned value is harmless there.
Aligning it anyway keeps all map values 8-byte aligned and grows the
struct from 36 to 40 bytes. Entries are allocated with kmalloc, which
provides at least 8-byte alignment.

This patch was written with the help of an AI coding assistant
(Claude Opus 5.5).

Fixes: 880442305a39 ("bpf: Introduce load-acquire and store-release instructions")
Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 kernel/bpf/devmap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/devmap.c b/kernel/bpf/devmap.c
index 1b8f0d7f8..0ef24e3f9 100644
--- a/kernel/bpf/devmap.c
+++ b/kernel/bpf/devmap.c
@@ -70,7 +70,10 @@ struct bpf_dtab_netdev {
 	struct bpf_prog *xdp_prog;
 	struct rcu_head rcu;
 	unsigned int idx;
-	struct bpf_devmap_val val;
+	/* Returned to BPF programs as the map value, which the verifier
+	 * assumes to be 8-byte aligned.
+	 */
+	struct bpf_devmap_val val __aligned(8);
 };
 
 struct bpf_dtab {
-- 
2.54.0 (Apple Git-157)

