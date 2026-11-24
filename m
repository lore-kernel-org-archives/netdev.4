Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795500103;
	b=N/DpX6vkMwPL/oMWGOl291VkAhYs5HrhDrS26mZ6GuNfmR8ZqEQ+87qw3jjprRHvmebd
	 O+imHTQmaern0AqX6fTGkJiAtbm1rFSK/uKWQWubybL4EyxnUBUNwkaNtN9wEHkpDVTjq
	 dSrTTk7rSb+NUGT+DLwPWZyPhqwVMcOz4COJ00p+tDCy7l+EpwkNA6cuzVBzbA2JQ748u
	 cePmbQiCgGUcZUihSUP4J5b4cjJ0wVJAT6PGp4HfujM+Bh7ukx1+7aK/vDRI5f8JeI31v
	 LTcnhH2dPsiqPm1sR70lxbTWHldhl3MDwMaQFkmkdIZoWlLOUu2Dy0thfvaJVgqPKyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795500103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Hd0FyVaBCqYKrDW4+6B1Rq0s6WrmUsyCsmH2bEmwdQ0=;
	b=Tn7tsscu5U/utHZBJkuSnsmuvEy2jxKyCrF3uVVoRCsmQGCk5cCuL1Y76gdIZkSl/XYK
	 CXvAvHl6WocFVcLtNzAC146zr+b7mU0N/WIA/c+eFLw1MeVFlJCd0Iv37f27tUjXrJTmt
	 TdFFpo8/PNtcjLQ9E0mqF0/V+kYZsz7yRWUZzkbuNRbGGyfYxAZTY9BP6gPSYjcfeuisM
	 Z0RWwBl6YGxhTwvjQyzsc+KFeZ4nW5s3ssy52MZeV+WMV0sujvj+BettWgDokaRm535Ak
	 FJdgPty4tBhIS0y5+1JNhj9xX1lgvYK8RrgAzPpuAdutIYUUuHsxsKOMa7blVJ1jWyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MYENWj3g;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D1A606A331
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D1A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MYENWj3g
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so5848863c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 22:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795500103; x=1796104903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hd0FyVaBCqYKrDW4+6B1Rq0s6WrmUsyCsmH2bEmwdQ0=;
        b=MYENWj3gw05tOHwGEnpqcdu1IHUzJZ5G4wHhxdY1/P/yiWJgTbEjqX21VGHmsojL/Z
         aQv9Od2vkX4bYD6H5dFfaXQr/CZHapa8j6WdDcrqFhKrkCLZbBmgw3bIlGLwJZwwrmj9
         EmHLs675zDoB9NnSB2eU+Y1g5AwXqVqdGkyzjaIU+eph9HwEOban/sds7OvHOVnRnoaA
         i4hfXwbMtSTcQOQ9eci/PmBgmK+c6IycA0PrJBVj5D2EIl9Z0OcXBqqw89RB3z9gUQJ1
         CMyNQIOFGJ0e0oPTtu1sD3MKMfcCJBMr8YEs/u89fY4OQg85iouElOtbSPwGRIR2dtrs
         jsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795500103; x=1796104903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hd0FyVaBCqYKrDW4+6B1Rq0s6WrmUsyCsmH2bEmwdQ0=;
        b=nHXTx+cYjXt2rLFdezp21kC1+r3cAGNWfu7rmewYROrV+zyYsQfz8+GXjxSS9OvuYP
         uF4uwNvGe6X01nmxJEzan9s7E5+zPGNV/gZhvPBi2J/jDA+XLpB6wHzvrH+ILi+8OPwI
         LuqzLhQrUM8wX8jk4S0uoCNANszuwqsPnyA709Np0b8jpvm4+TGrxHnoNhELm9QpCW2p
         kADW8fQaDYI97wvOjqWw0wym0UzeZ0d8c1sILcefTF4gzNqwLsBv7NQIJ6cCqVjsT43l
         RttgWdGGJJ73Ql1oK9CebHFxFjGfXzH9igQAb2vqsXmurCvJCVgsJac/2qFgrZlU2Hx2
         u56w==
X-Gm-Message-State: APuU4Z+eAibOYsjVukdVCXPj3JGiLBLoSn/69AFzh64RZjG57doTz6gE
	J/LV4HjuUe/4/IWguQYAPpWivNFT6I4WGgyCjjZ4FE8SkPn7lfmZIh2wiLRBHA==
X-Gm-Gg: AZFdTZeJT/aanV6afMhLthVNrYDvAVyZF1UaBNIiyMEkLVGr6D0+jH0vQXyncZJEkQO
	0Ju33olGqDHF1PE/B6s0w+ytvI+qyoExOre++92/ANJ8NR4iYUwTMqUew4dQlVT1oTe42UwBF/e
	Gil1WQ0YN2akvBSYChZ5h52VdyN0gvO73huQptBd/vCdycnHj2a/3LoR0XYm2E5Bf9u3xSnuc+y
	svqWUS4Wb2v5rAvPDMUnqnJaT10g308v0GYO0VkkLIaHcTGfHMJfWrVja/qIcH8RkWGcE3EzfkS
	qqcjtE37gWLc3OWXhzpydmhXNOhnpwKqfgHixvBDWDE9IveoTxzGX4DJ3UQOIvr3kZsCYbxaF8a
	HPglsaHnqpiS32bip5qmhSyxQFTOTw8se3SZFDJ7Ro9+vekI1T8ymVrc1pYGACEUpXgcyraEbu8
	FLvI523nlrFvE4baUXF69LQ1U1Yp8M0gKnNQkU0KvKiSQZFgAZzoJtNxLYVUFuDn/qlAxVoT0wh
	3HqehC+7+UIqVDBrVaPVBMBfFd9vARkAWphC9/4mdhFj/OYg1YfMpUqLpKer98Nw9Jp5wgvrbPO
	fPkTrhq7ZwWDhYAvYB3NSZc3l3hr1BJ5WEjiGEkRUr8DKwoRyudNlpMOmWWxeYMjLjJpQ3EGNJj
	v96bmR3G3QESNd0TkemVJNs1GzFHBOhCoii6uchY6Jqbc
X-Received: by 2002:a05:7300:6da7:b0:376:77e6:a66 with SMTP id 5a478bee46e88-385704509cdmr19975836eec.16.1795500102394;
        Mon, 23 Nov 2026 22:01:42 -0800 (PST)
Received: from l ([2603:8002:ea00:6800:e2af:cae4:df96:350])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm47446163eec.26.2026.11.23.22.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:01:42 -0800 (PST)
From: Dave Seddon <dave.seddon.ca@gmail.com>
To: netdev@vger.kernel.org
Cc: Dave Seddon <dave.seddon.ca@gmail.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	David Ahern <dsahern@kernel.org>,
	Eyal Birger <eyal.birger@gmail.com>
Subject: [PATCH iproute2] iproute_lwtunnel: stop encap xfrm parsing at an unknown word
Date: Mon, 23 Nov 2026 22:01:41 -0800
Message-ID: <20261124060141.3393569-1-dave.seddon.ca@gmail.com>
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

parse_encap_xfrm() consumes every word after "encap xfrm" and drops the
route options that follow without an error:

  ip route add 198.51.100.0/24 dev lo encap xfrm if_id 7 table 100 metric 7

adds the route to table main with no metric. Break at the first unknown
word, as the other encap parsers do.

Fixes: 75776cf2472d ("ip: xfrm: support adding xfrm metadata as lwtunnel info in routes")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
---
 ip/iproute_lwtunnel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ip/iproute_lwtunnel.c b/ip/iproute_lwtunnel.c
index 9a1e747c..6b110552 100644
--- a/ip/iproute_lwtunnel.c
+++ b/ip/iproute_lwtunnel.c
@@ -2276,6 +2276,8 @@ static int parse_encap_xfrm(struct rtattr *rta, size_t len,
 			ret = rta_addattr32(rta, len, LWT_XFRM_LINK, link);
 		} else if (!strcmp(*argv, "help")) {
 			lwt_xfrm_usage();
+		} else {
+			break;
 		}
 		if (ret)
 			break;
-- 
2.56.0

