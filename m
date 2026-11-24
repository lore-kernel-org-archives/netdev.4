Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795499752;
	b=YWE/xQF4Tj6rmBPuCqDYfYj3qfmZLgAYekEX/mZt42TAH0InEQl3fkFRT5533cEBqJ+5
	 Us7UF6laO/i8WzIUUtl1ThQ1y+mKnHpkZEx4ir5PEJqZ6aRZZoedhGtgLWzMJdrngEebc
	 tuoFld8jfaYRsVrtsQtLmBoQcoz4VM8BbWlmPdEBuJndq30pDaTwkKOVqfcUvn1GJO7UM
	 eczkhlseIpyRTdpJjvLeBV/scRxM7hAOhAYQEakjx8s0mmghwMB2Og2FHKy9kX6XobXTw
	 zusTjABDWhRyY5n3Rz5IXbbCuGP8YOHOO4C3OgE8sdrUEoPXVieyeor/90miu0YpjCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795499752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZUfyZmdvxLB8ox9VfyAacMVYtVqbX3ACo/Rkifv/U9o=;
	b=diVO4cAnjf+SwUqmf3x4q96g9yIwiQ7t0Um5rHErigxhewVSBXLMFoDQyQuLIOvbzH/P
	 1cCZ6hzNLip9uM1IeHi3yDpanjN0007jOze6vdOHxUbLoc18bNgysAPSudmh3KnojYBjm
	 dNOpXGcWHpE/gNXsupXzO1O5UtpIzXXQauqGQPvIj4ng4EMNALI7eTUdOdM7UrcZ9oSa2
	 weUezwx7OrFIkS6THuokT0t2A9zOesuxr9nCVIpAvIobKtW4US0pfh6+ZXYw5Wpl11t7i
	 J6VCXqmAPkZf18D6Uzt2yaXG6Bhc5rtzXBXm3mMVrNFnrpTB2qfReNHOEySrNNGGnPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fYUiPOZA;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47677606A322
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47677606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fYUiPOZA
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-385c497bf94so3858261eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 21:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795499751; x=1796104551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZUfyZmdvxLB8ox9VfyAacMVYtVqbX3ACo/Rkifv/U9o=;
        b=fYUiPOZAkBBEU/Pv/JWIbjBypHF/L12n40iFqcVNSNIaV53P7dmPueFzByxtKED5YU
         nefLgaGibEkz2UmpJA5cZ8zy7eMXVi5z0982KnFGRm1Xoaxv2m2yuuwWZCfPtUN++ifP
         MpN1nYhxuv3OGCFm+EpJZGuFX2un/m0EdiIxCQJqH1GWx7xuuarqhjIxAeLAj8ISXeeE
         zQeZrFwq3rAckghKWaxqBA21o03yL3gil/lZ/7kybFj7KV4Y3ihIsT661YhEbLwSS7XW
         nm47ypSWPk3AkzJASET8Hq0RcgtRiPhcKpRCdU0Gj8jpPfh/5kxmsFKrjDP4bSX9kh7F
         T0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795499751; x=1796104551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZUfyZmdvxLB8ox9VfyAacMVYtVqbX3ACo/Rkifv/U9o=;
        b=Za43p01Fn5TLHe05PTi16kDBGKq2zxfQhPHwwsnajlkt2JENUn6QnrE6uqzBRCoiKa
         IX89QzBM17d1bg/zrnFTBND7HnGCQRT8cCdYC4o9sGZhzRNsDPsu+RhW8jyBrPVQ1sEK
         tvrGVOjqfRzf9jro6IgtTdKaU5p3Q23uNl3DtJ/AbW80/KnZnuS7A6tKy8Tv9A5bGQhI
         vdHDQ9UIcNTXsUrGYMBEsyu3XX83/3Vfa8UT7JjZOz0bRXgGIpZbcZueIBr+uCamfWGE
         8xaJNNttuJC4d8Heo/dWnJcvwhSAmIM1Nlz8V5m8jMNcYN75whweIiLp38gEEYY5RGx/
         8OxA==
X-Gm-Message-State: APuU4Z8WjAgSYSla4FllMhiXsskAw3dmC4qqH/+HYrHv0I7qOOaGprQh
	3CnUsNvuwrxz2HeQnOC/aBClZO9REFMIv1lmUw1xlyduCQQR+O4SyVzVrTTv3w==
X-Gm-Gg: AZFdTZfOgcR04cENFtzLO97O5RlBqOJICE1r4qTRpVmN9FRQtCZINWfpBG1oM5AdKZd
	5llbuES/znevDT+VI+OItRDdtxeOFryNJlvSiE8p9piJNQ2NMyJJl7e8u1Ez1uMSUBYJ9D3nrug
	YehqiyJeY50eFTB/8yIzUsS0xqpsTCk3WZWhcX4HZsBHcXgPRSa2wcGYiwF5X3LmVme5B8I+GPa
	vFSGitsT0CkBN36ojs4KutR5B5yMLJ+EM7yOqRLcwUBCFnLDIqJ2UEO8ygvmgIsd+0KAKGj9f+U
	I0Ks9eFVI5EEjkhcZ0H23cXeB0pHwowkYsMMMxoDdUTP1sJWT9Tia8z6Fl3UwOTC2SlUeZWB8r5
	vPiD2k2CdV6pvIiHcVKKToAKN1zhEzXCLMfgRy9p6KkG/+PqT2gpXLWV1AGTV7jQk1arYThsEqw
	laZ7AsIv5pPW49KYU2ErmVmQBLUp4TTY4N/YQRJicZmsaTzfJRneg+Paigexh0YrEW/pNgpVnmw
	KNbFQFT2Sbsw1Bw/gukr1t9O18B7ypdXOif5sQLzDxGU3n9Fel2mHJPUG09uFHQiOrz+8iKW/WU
	rlZ0ZEQ1IIQWkfjKrZGQTc0Qt4OWpvfgWJf2tEK5Lcfnif+cYzNe+lk6SJpxsXDr30EWuYZ3qQ2
	WplKMdvpjRjsVmqIJ8K4THditCFXICJbRa5bpo4wwkMnW
X-Received: by 2002:a05:7301:4718:b0:369:fbc1:89c2 with SMTP id 5a478bee46e88-3856e63afdbmr14719801eec.8.1795499751359;
        Mon, 23 Nov 2026 21:55:51 -0800 (PST)
Received: from l ([2603:8002:ea00:6800:e2af:cae4:df96:350])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm45589194eec.21.2026.11.23.21.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 21:55:50 -0800 (PST)
From: Dave Seddon <dave.seddon.ca@gmail.com>
To: netdev@vger.kernel.org
Cc: Dave Seddon <dave.seddon.ca@gmail.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	David Ahern <dsahern@kernel.org>
Subject: [PATCH iproute2] rt_names: do not write past the end of the name tables
Date: Mon, 23 Nov 2026 21:55:49 -0800
Message-ID: <20261124055549.3390238-1-dave.seddon.ca@gmail.com>
X-Mailer: git-send-email 2.56.0
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

rtnl_tab_initialize() accepts id == size, so an id of 256 in rt_protos,
rt_scopes, rt_realms, rt_dsfield or rt_addrprotos writes one entry past
the 256-entry table. Use >=.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
---
 lib/rt_names.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rt_names.c b/lib/rt_names.c
index 3dba9642..97f520ff 100644
--- a/lib/rt_names.c
+++ b/lib/rt_names.c
@@ -115,7 +115,7 @@ static int rtnl_tab_initialize(const char *file, char **tab, int size)
 			fclose(fp);
 			return -EINVAL;
 		}
-		if (id < 0 || id > size)
+		if (id < 0 || id >= size)
 			continue;
 
 		tab[id] = strdup(namebuf);
-- 
2.56.0

