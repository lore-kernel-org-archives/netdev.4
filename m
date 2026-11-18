Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018611;
	b=W9fV0bqRnVv6iaKKTcY/Cm74UgNAbgDNJhv0wXyLNismXgtMVpHr4J6P4lI3lgZBEkSX
	 GwtWatbUN+JFQlq1eQz3AbqPRjliTmYu/8QEG6tmLS019K50w5yXcQGPCfd62u8dvKZ/K
	 8jtI5enCmm3uE91sqEht2a99rMb1c1W5LaG5Ntnky5AdVeGVw8U9whd+51RV5SCTNo88g
	 ACdXHiwtdfWJJC2ZHeIXMkZUc3BWQ+lsW2fR4UIoff0eYYqZyEcEjaffz3ExUjiJRrVkK
	 DMwvWWmTmNjS1DcvZWc6FZx6ncHZQM9Ki9fYGCpS/9nRBmC244qq/AKjbGwR3sw7ERw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5Mt1j1NeBKppdPhQUtkeyMgCerh85ZsDSz+CjHWhBd8=;
	b=3tSW92vAYXh/fjsSEE7WmfnZa+Wv2fpaMNaCSpB5rYfCGwRamvA6rqvl8lUN8BO2Q033
	 lSgksBWjHvghZfg89GiOhz4PJ/SuxOWiJ59RA+dhSvNEgj/Q612SfaYmoceCNQrsXFSW7
	 JR0xcPgdPWG5G/V0mI23sqYEjqMnQxwsltAbNHLC87sr/xduQirFDxY9mCkCVZ4X+vtyn
	 PFs9dpgxVt1yysyOPx3CNZeTGLh1JMjNXs5fMQbSwyCPXgi5z/DcaZzgLvVH7nWI2BA+8
	 74A6+JQUMg+xvjolsCr/CwcM3w10mWQed0V0d36hXVjyvNUaAokLC6JlxqyIP+qEtOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YF532Un7;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8D9606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB8D9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YF532Un7
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3d12563ecso507185a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018610; x=1795623410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Mt1j1NeBKppdPhQUtkeyMgCerh85ZsDSz+CjHWhBd8=;
        b=YF532Un7EfdsWUOyRvMcMPwNcfTpF8mLMNWjr8N88MGn6ZYleGUDOqh670UiNeMiPX
         MYNTt5y3qfJwfKVC/UgqOt1Vyiwyq2V5n2U3rhIuUjz5TSLBBkgHrPc+fkxDlgr0CrpX
         z/tvtjU7YgyrObfxzp6ETdn1Kic8NC94yvGM/I1fSLpgqUKEG3FlyWYVm+WvfpOMEcEn
         mtexkcehBm4WD9RLbjeur1nf0XCnsYQDlVNyUZ0UeAr9b7DZr0Meoq3jB3p2i0ZbS3Wq
         twEUyTQfHFOV/cBfSBZu6yGiQN9pNFSqermpNvBT0URnd2fVANm2u98hFX6IIXNZA6M3
         LLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018610; x=1795623410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Mt1j1NeBKppdPhQUtkeyMgCerh85ZsDSz+CjHWhBd8=;
        b=ec/bSymGpXVwGQQaAZEcNYiiZEtz+HKozRdkhN2z0Oe/0TpmoAijjVXivHpdI4YWvY
         wqcz2zZlc/4i+nGMsiyW/rOnDSeAmZkQwxizT/lAICdnNFNiEU8CuYgwtWKslK0OG3E8
         m2wKlxVQjOWBdXWg/PZlmu9BpzPD6QRa6HoS6JoEW3BJM/2BwY2XhAno/bHopCoBZgqG
         SjwY+wEOtDneu/Z0JeFREkx/FAbjm4f8zEums2RJ3hogEdCXnUOdaV3LTrGEU9F4mSHu
         1GLZAJ/6ZdOG38u/oOa5VFSKKXimF6eF5KJ3mF3V/Ibyti91T144CusHMDUGiEC1GFar
         GyTQ==
X-Gm-Message-State: APuU4Z9ypGuZp1UVtwQYMITsorqhH0tCry87D0wuV5bK+FFSY4BRlMNq
	+XbLzKiQN+RDtyaQfgxsXeyA3VM5Ux8CpKhllWWAWgr6oCHzvpyRFETuzrYI3P+V9rvntQ==
X-Gm-Gg: AZFdTZd73Dhqj8qT87xobl8BxyNI8l7T6ByvO7vDHm7IjFdKBtVoc8PiuG/PcuixDDn
	eLyuwHWGqmHK8PQufauFVPkgmPvSLVT/DXPm4dmduueYXecFhFUeSQ94E2V8mOdMdzUVqxwzPbq
	hRzqHk5QjXVrtMN+4fRzwDqIV5jH4/30D69JUzjohXY/ZaWUefKISqchJWc1l0tOnLWaWdO4bVX
	azmE1fIFbfqxB4dbc5mb1yWYTGHfBTA/XjuiIrsNpzsqT2Md1BQlbKNd6gD89Z9NiFxI35mod/T
	UTKiFH95sTP9jQsjklf3qM1seMlM/0xiMJTsWKotDSWNVdVdsJThlzz+FQ9xlY3LWKYySPKnxxs
	A+m/NXzOmpxA+DfTX9DJjklWHgGeye838tdSiEeCt4zKqPB6uG9sUK2WSLiLwxY/mp6zkikJWth
	hxxBpXSDTJSuhR+VtaEgYusDrIIDw+5QEXSvsIVibqPNiL4FmvkZje4tHAT1CD+06Jabj7dFaio
	ARPyMXq3mhbYNB6bYVQhOss8vM1glkKFKV9x8iqioipg8VTp+35nh36kJd0jqdeiWzzfDy8khCX
	yL5V4BbNzyij72BW3tpmL3Nx9tPpJXG27JtoOxSLKWG7ctU=
X-Received: by 2002:a17:90b:4b86:b0:3ab:1b19:78f4 with SMTP id 98e67ed59e1d1-3b3d06a487emr3376460a91.6.1795018609907;
        Wed, 18 Nov 2026 08:16:49 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde533658e4sm256978a12.2.2026.11.18.08.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:16:49 -0800 (PST)
From: Shihuang Liu <shlomojune6@gmail.com>
To: bpf@vger.kernel.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	kuba@kernel.org,
	qmo@kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH bpf-next v2 2/2] bpf: Reject maps without iter_seq_info in bpf_iter_attach_map
Date: Thu, 19 Nov 2026 00:16:32 +0800
Message-ID: <20261118161632.177820-2-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118161632.177820-1-shlomojune6@gmail.com>
References: <20261118161632.177820-1-shlomojune6@gmail.com>
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

bpf_iter_attach_map() checks map_type only, so an offloaded ARRAY/HASH
map can be attached to a bpf_map_elem iterator.  Offloaded maps have no
iter_seq_info, so __get_seq_info() falls back to the target's seq_info,
which is NULL for bpf_map_elem, and prepare_seq_file() dereferences it
when the iterator is opened.

Reject maps without ops->iter_seq_info.  All map types accepted here
provide it.

Fixes: d6c4503cc296 ("bpf: Implement bpf iterator for hash maps")
Link: https://lore.kernel.org/all/20261112105620.57520-1-shlomojune6@gmail.com/
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 kernel/bpf/map_iter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/bpf/map_iter.c b/kernel/bpf/map_iter.c
index a58c148692e6c3..9e459a2d34c3aa 100644
--- a/kernel/bpf/map_iter.c
+++ b/kernel/bpf/map_iter.c
@@ -176,6 +176,10 @@ static int bpf_iter_attach_map(struct bpf_prog *prog,
 	    map->map_type != BPF_MAP_TYPE_RHASH)
 		goto put_map;
 
+	/* An offloaded map has the map_type of a host map and its own ops */
+	if (!map->ops->iter_seq_info)
+		goto put_map;
+
 	aux->map = map;
 	err = bpf_iter_map_check_prog(prog, aux);
 	if (err)
-- 
2.43.0

