Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795459108;
	b=w6bqnhDAxPB9ddeBAQAFNeRHxtrPpSxpMGu3SHmNchaMMlTd2w3s7KkHUzFFN6Txvb3U
	 2uvofJxL673QxqdX3heUGYXEaEvYKM9Tp9ir/9SmHTyVNddxHQDOEtT2AvKBmeDgBS7Dn
	 Q/IsEKFFxgAyc7xxgCzJsSpqdAKAxn4qFgBRFOR9DBoVrOoo/fAk9tfZIdlxB+7DqN6ZL
	 1wBXo+XOaUmrx3ATBP5eb5iK1I0Pc4S12aPjv1isZ7HxjXO/vF3ZR0IjM7EgVCpu2641x
	 gwmb+BUFFURcSxeDL3pUyjV0Mma9vct1bZIadKX+DD8pwKBDZUsnEbMNxm0QI4MODJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B6rT2mc8WeFdjm1vVBne2NA+OPpqByCAF69se4xF3d4=;
	b=PBqMs0mfKCGrsyK+pb2Psu22QSv1dQqVdw706FwfPwCmlP1jADa+0lT/l4jigCiSghA5
	 Qcen4KpyIIa9tgmanTl2kqMW0DPu22oErBvICv3lfp4uTHUProbh3n9AcouZqnLnpfIJ3
	 957K6+Z26BNZNaSaF1QVYZwMksc+GIipLtcTiiteNUtLTi42I8rn9bFgpzaGUEa97LscR
	 BiemokORQ0dnbp03nrjDgF8F43HDzrW1PcVYkj/G7a9SOpbn7dtFg0rd2onfyzmDziOIR
	 kuWZmDoVCKVGgrdsbCiCADWP3vVK4kG+zf/7xoWnAGHNfuAIkIhwt+WNkZFK8tXMngA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YCoxV0Oz;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0F606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10B0F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YCoxV0Oz
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so3479519c88.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795459107; x=1796063907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B6rT2mc8WeFdjm1vVBne2NA+OPpqByCAF69se4xF3d4=;
        b=YCoxV0OzkOyM2fdNuBNuyjI011Ae7t2DkkCoTkbvytolV8hQiLw+LzzO+gevKO+G5l
         /4Q2S2vsx4TifhlQB/B9D9iy01p6u9chqcGCGtqMy3/4GZ4kne38GWyO7OYnwIBo7WPF
         R64JDFXDJOUUShESgPiEncrkfPHBHPQPzHarpNKemQNRZGBp/Zd/LAIGKATbw32X0R5l
         ZsX/Ru/LzU0WueBH8WPTjE/CuiVwMlssyqxgCvQHLZUtESI3+j0N8rDf3IoKDjZvBXfJ
         t18+Af1caLBxpPU3D6ndV6P38BnMWfMpIk/FfBEkIcw3Z0Lz2p3UmBjEX8zPTl1oyVgd
         A/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459107; x=1796063907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B6rT2mc8WeFdjm1vVBne2NA+OPpqByCAF69se4xF3d4=;
        b=tI5eyTne0YNjd6O90tSnG42pg59cy7WGJVYDvEJSc6yiziPcwzTYn/NzmnnMSXyAh1
         OhUaOj+uaG7GPDlwY/dkgIpGqGJLWv5dzf7vcg0SBuFFus4/n+ulXWpVt4MoWmfK6+DS
         T8Tu6Kvj7sBPAARHJOycWRpXlEl61ksP4NNHlkD7H2TxFZ+Gq0nJ79N9kRsjNpMGKed9
         EuxW7LjVIDqJ8oO3kpC7xobW1wnbZdwi1Jlw9hjAyMjL+kPpjSTL2obqNd+m6URxJgyY
         LjLMGcLCp15NPKgi9emqp7+J8yuFq1gWL91yjWTdUBqqvzLO/Nd1ByUsUbXl0NEE2pKH
         KFNg==
X-Forwarded-Encrypted: i=1; AL+hErGgF9odgRqJnKAekWRcB9jsYWqtA/b1X7Fo7dIgnXnfeQcpytgoEz8Tt9DNm2Vzk8sYwmAisHw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FZwU71DsO0eku325WEeUJ/NVoraOt3OVQph/McLSQZ5050atQ
	qw1MrCzA4cNW9SxYiITlmkEQVAifrPzCl4ma6XCz4/3aHdIwsZtUQjcn
X-Gm-Gg: AZFdTZcSNap2RVAVypMwm5whyL4ACdL8ZLBLR/4Ll+xXiPGgkBcKU1Bvdw5ozYFarCB
	Sz6AOsFKvS/iA7jE63+zla8c02eY45dVXkWhDJGZHk6zGSXMG8dTO7jsODlEC3ripKpENuWVPRo
	rIobHMMnvvmfx0UMHmJ+59ZxG0I2rVhVTLm56WWO9J0EJ2qfYwbMSWYwHseJcGc46chVLNUm3HI
	oyLTjRu2bfCedzcjz0lJdRhsWoTQitLxqnEQSmKY1RSEVuN23nYxquuoSL2TZKxPc/m7E8TNYe0
	dH5IaAiSZ3Bl3hTnltf/3gmLYvL536TZ+w6qNV/2q9No+dkFgtCAxIDI9amWu49mGah3JCokYYN
	/ZdXxWMTOjSD2IwzGJnuXBKLmtmNC/cV+PUk1a8IM1p6AXvXK/LkJ3F9jb2UUpIncBImmhLqgiH
	IB78mCPuyYiCdzGdXNjbFNcRDfPvwS7xAhSethAuLB/wE9sp9vowsrwcHprzK7ezRbqA5gYuDe3
	GcVWE7ZobWkco2aM+jXp3YvDu/s2vLk6Nyfe7PvMsLUlhvVF2F9TSn99rg2sowldmZ/ikz3A0xB
	4STsOfNrE/GL/BRgRCMmrde0iF0J0h0VHFWr+MI52Hx29PNJMuFK+nyt+gpJHj7TuBUh8g4STUh
	CbbFL8j3p4YSICTGJywQ233CpAA==
X-Received: by 2002:a05:701b:2604:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b5568b9037mr12781657c88.27.1795459106853;
        Mon, 23 Nov 2026 10:38:26 -0800 (PST)
Received: from ip-192-168-31-150.ap-south-1.compute.internal ([2409:40d2:2011:872e:6565:a2df:e6e1:88c7])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm28875720c88.3.2026.11.23.10.38.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 10:38:26 -0800 (PST)
From: Tanuj Sharma <ertanuj96@gmail.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: gregkh@linuxfoundation.org,
	netdev@vger.kernel.org,
	linux-hams@vger.kernel.org,
	stable@vger.kernel.org,
	ralf@linux-mips.org,
	horms@kernel.org
Subject: [PATCH] net: rose: fix OOB read in CCITT facility parsing
Date: Tue, 24 Nov 2026 00:08:18 +0530
Message-ID: <20261123183818.24508-1-ertanuj96@gmail.com>
X-Mailer: git-send-email 2.56.1
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

In rose_parse_ccitt(), the 0xC0 (variable-length) case validates that
len >= 2 and that the length field l is in range [10, 20], but does not
check that the remaining buffer can actually hold l + 2 bytes before
performing memcpy operations at offsets p+7 and p+12.

With a short facilities field (e.g. 2 bytes) and l=10, the memcpy calls
read up to 15 bytes past the buffer, leaking adjacent heap data into
the facilities struct. This data is then copied to the socket and can be
read by userspace via getsockname()/getpeername().

Add the same bounds check that rose_parse_national() already uses for
its own 0xC0 case: if (len < 2 + l) return -1.

This code was removed from mainline by commit dd8d4bc28ad72 but remains
in the 6.12 LTS branch and all prior LTS branches.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tanuj Sharma <ertanuj96@gmail.com>
---
 net/rose/rose_subr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/rose/rose_subr.c b/net/rose/rose_subr.c
index XXXXXXX..XXXXXXX 100644
--- a/net/rose/rose_subr.c
+++ b/net/rose/rose_subr.c
@@ -369,6 +369,8 @@ static int rose_parse_ccitt(unsigned char *p,
 			/* Prevent overflows*/
 			if (l < 10 || l > 20)
 				return -1;
+			if (len < 2 + l)
+				return -1;

 			if (*p == FAC_CCITT_DEST_NSAP) {
 				memcpy(&facilities->source_addr, p + 7, ROSE_ADDR_LEN);
--
2.43.0
