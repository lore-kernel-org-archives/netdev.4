Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953742;
	b=MaouFzF1erUWdecIGOM4UmvUb8Y7gb6cIq044Rl7Q0sz59v33j2fLfYq+ArWYMu+ncdj
	 jFuPF3ck52giGWf0sBnZqhFe+AN0NBJCMhU1D/ZfqpcXtOMNn+QA1U9T7hwhiXDaOXn8u
	 mp6yc/8HXsLWyd9EJdZgFW6unL1PMEUF44O4lBgld10Gz9VRfCKbu5JdenMmr3rVCSndq
	 X5jgj0FLoPql2ycjNWZdY3xOnqOOzzBJrISpfNrLW5+B7Gp+jJ1GewEvx9f5uRKBl+Qqo
	 PP7ClYzDhX2WAlDqxoGTPHcwuHTS5WRDxZvghZ6Dk93PlnDKf/ILhP/l3yM0mqDapIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qb5d+Qykm6EKuUkiLZkhF6IKbKMDpNXXQ3MYy2qGuWE=;
	b=0cW0ZERrl938xdlco0FsGrYEr4DqRfPsGJkavKnP+142x9h+tCvlzZmwUtFjvVvSX60e
	 X2ONHGwdKYaFnfzIEENNSwIl0MZKXh1xZtEIqU2K3b7PP2cd69zi4ou2MATYSwTrzen5n
	 7o/HZsidmX3XLSbO5f1ulf419Lv+hR0w/7I+pjBoIEToM2F38hBvfaBDTO7Mn76sn5wuL
	 HLxqYV0rBwiQAiaKdV/dilZvIBKqu3M+dsp6Sb7kAAErgfU6IiHHBof0T/x9ibHyFu/K5
	 QLnC6zTNGvD7AlAJ2QdKvc0y15rjcrUnZzw0Qa1A964rt5/+ERdaRPA14Bd3wYljSbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ncavSq0a;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88A606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 22:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B88A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ncavSq0a
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso106820a91.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794953741; x=1795558541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qb5d+Qykm6EKuUkiLZkhF6IKbKMDpNXXQ3MYy2qGuWE=;
        b=ncavSq0a+99wl6UzHcFCxzIZisu4na/NK0P/gMZ6tX5KfrAcod2TDI7FDTu6Yet+a4
         w9GfrWGR8zO5blC3XQmCxHqXwiCg/8SvrrDDsVhP/2569Jv5f3E6D+ubfg6ONRal20pG
         j8QuvkUzsOHy9k8yWY2gw3KydVek+EQGt3CF2eonMQptqpM1QvZ8WWLjRoVCm+v0q9Ky
         ueIxUDP6k5+dB2j7sSLw6uLdeF5+RoO+bb+bWCGiYEgJ1kTwEuQSx1VeUtMKKc0fYevh
         TeKhubVBnupsw5BZdR4CASliwJkOXJFuMiA04GDXVvePaNj2Uy0iSO8J6eVqfSLSAU81
         fRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953741; x=1795558541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qb5d+Qykm6EKuUkiLZkhF6IKbKMDpNXXQ3MYy2qGuWE=;
        b=plPIaKrR+191X7bGDqBl5fxZ6eD7Fhy0xcqVXXEAR+4n4QoMkmupztsWmP4Y5q/Hjs
         mnCLHIbh9ARMkOzlaDo8SFBuIhFLOB05FUGTq8N4OBn6/A1LUrrehGsvbIhQi2EsQhAW
         Lr8da1t39YuGZSD5kuPUgFVD42bxuQD/7kQUocPijYx32vYEFbTbMcUXciZWmngr6yyZ
         kJeBIbdoRyvHXZSIPJR5dT4GpfpyAocsBV0EuXcSdBKqWlEOANZQsf/zCc96BZX+BDC8
         FzTMtNBmkuyMYVpKJsZVx6zdphXuBnv6G1gKlXlEr2R+LNADbFPSa2Rn6//9Wym42/P6
         3ThA==
X-Gm-Message-State: APuU4Z8tvPsAEhZsffsajgrYe71Kw8VjhByZJ9QZrtLvimrjxtuIitC+
	pj1GFM62CIwJZjrBwjmJmMP7Q/qkF66HFC0tr0PMCsmujLPUt8gezPKAYCh5AwLuTCy9faiND5w
	iqk7S
X-Gm-Gg: AZFdTZf97hQoMVcpF+HtIIZ2sSnUN0ZI3HGppyr0HfD5WQ0PBjFSI4kuuTAzkXxRWyV
	gNbiTtTVwtGUXT7OF2fqk/VhNQcrZ91pGWKTIZIjb7TtqFsmzTRsL3UlyWqsxf2NnOWLynVyoVQ
	VFzDHXc4z3MtX2lnxFl6eiX3pDMIBEppmUVguJ1HM6vETD7ZaCni3wJWKDVFdgUcyy06DHz3Uoa
	OqStTn9VlFDWx6a7y5QcZDvIVBDokDGTnW/hyB/pah9kFpYPieqC6bRR6xdthC8cizlzVrQqZ6W
	TwnoL0e5YeQdju0lSGzSsUbLsqkUDBEaJxcEZa4tm/avSCCmBOJS2hBVAVl+4HanmE+htzLgvbr
	4cmOGwfJr/RUgRwqOFum+2/EIxHfNvdXv8gtaEvbQ5O1/4VFJM27t8k8qGo+rkzhCFE7dNv7xMN
	rh66tdRg76NnwOtjQzCKUqj7IXm5m+pCDK2HiccA/Ml+RVx+sXdGzsRC4BAu7bUp9EvnHxxkgpy
	4WugIFuDiijpVRvMpstPCWt25MmD11zecXeJnama8VUEGCAAxFUqw9/AFEAWLLhTcWBvIluGk43
	7aLyoo/fwpxVGw9F0svnXDPp2OGN4OSHFbtq5K0d8M6Gm6VYYRlsDxG9ttsl3dXjtS5d91N93ki
	4oTjBzG+bdwNYeA==
X-Received: by 2002:a17:90b:440d:b0:3ac:9176:e837 with SMTP id 98e67ed59e1d1-3b3d07c7c8dmr700341a91.50.1794953740643;
        Tue, 17 Nov 2026 14:15:40 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm38067a91.0.2026.11.17.14.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:15:40 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH net v3 0/3] rtnetlink: fix truncation of dump entry
Date: Tue, 17 Nov 2026 14:13:41 -0800
Message-ID: <20261117221538.184948-1-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
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

While going through an OSS Scanner dump report for iproute2, I found a
bug in the netlink route dump.

If the first entry of a route dump is too big for the dump skb, the dump
ends with NLMSG_DONE and status 0. That route, and everything after it,
is quietly dropped: "ip route show table 100" prints nothing and exits 0.
It takes something well outside normal use to get there, such as a 500
way multipath route.

Two separate paths get it wrong, so there are two fixes.

Patch 1 covers the generic RTNL_FLAG_DUMP_SPLIT_NLM_DONE path in
rtnl_dumpit(), which drops -EMSGSIZE and returns skb->len. On an empty
skb that is 0. This is the IPv4 FIB case.

Patch 2 covers inet6_dump_fib(), which doesn't use -EMSGSIZE at all; it
suspends the walker and returns a positive value. That one goes back
further, to when IPv6 multipath routes started being dumped as a single
RTA_MULTIPATH message. It has to come after patch 1, since it relies on
rtnl_dumpit() no longer swallowing the error.

Patch 3 adds a selftest: IPv4 and IPv6 multipath routes wide enough to
miss the first dump skb of a fresh socket. The dump has to either return
the route or fail with -EMSGSIZE.

v3 - move to net-next and resolve conflicts
     incorporate Sashiko suggestions
v2 - drop Assisted-by
   - correct commit message about "ip route get"

Stephen Hemminger (3):
  rtnetlink: return EMSGSIZE when first dump entry does not fit
  ipv6: return EMSGSIZE when first route in dump does not fit
  selftests: net: netlink-dumps: test dump of route larger than skb

 net/core/rtnetlink.c                        |   5 +-
 net/ipv6/ip6_fib.c                          |   6 +
 tools/testing/selftests/net/config          |   3 +
 tools/testing/selftests/net/netlink-dumps.c | 297 +++++++++++++++++++++++++++-
 4 files changed, 306 insertions(+), 5 deletions(-)

-- 
2.53.0

Stephen Hemminger (3):
  rtnetlink: return EMSGSIZE when first dump entry does not fit
  ipv6: return EMSGSIZE when first route in dump does not fit
  selftests: net: netlink-dumps: test dump of route larger than skb

 net/core/rtnetlink.c                        |   5 +-
 net/ipv6/ip6_fib.c                          |   4 +
 tools/testing/selftests/net/config          |   3 +
 tools/testing/selftests/net/netlink-dumps.c | 297 +++++++++++++++++++-
 4 files changed, 304 insertions(+), 5 deletions(-)

-- 
2.53.0

