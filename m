Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205207;
	b=MZT4672KRirdmguXPrxI0FiTLOPgVUKIhS3ZnkXWGtGlG7PxbafAA5QIzGg4/QLCpDGs
	 dCWw5GlKnxCCcS0IEB1/wQy3OOy+gCN/nVyWwT4ew2vRcbCQssYa+QA3dG7WhYQlHvHuA
	 1QVU5sL7atDM2w+xPiiGKvRyEqXcuRFLOtNZcrU6S0LaXR9o9E/m+PV+j4VYwpZcXTI/T
	 W4C80OfUPBJT20CB8u/lQ7rHF5RBqt75mDCzayS4hoyf1k6UcL/kdtJCuQPumz4pQKL0d
	 dLUGhE3wKe4BRIBknQnH/Iy0YufmZhCLAzh0n68g17MvvHktaXppC4dubJBRLkU2lnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+C+q5ncc3dwft8pH4Ui5y/gC5sWH3mwGOFy5VnKoiV8=;
	b=Tmycy+0hga3YkXNkTGqaeMf7HxuNWeCLln75WNvQ+6UI0sbEUhd8YE9x9ZLWybz+Hfop
	 oXW6pp/lBBX/4mAiIgRTdtev4L95Bw6+jjsWYMRzIsdevJoQe3Y+AOTqlbsgz5RMm8Ak5
	 7BNjYGcdurPTcPOYyue9pVh3Mycu1AcDZjfJd76e64WLMDvp8xsyDay/EUUfZEwi7vKo0
	 VkHX+xmm27CcYntZkMKMYltCgDUobvnuWExCdF9cmeibIC8Awf5mqygHB/NWReUK2kPT4
	 lCqvnlOMw3fcy6tzP8jti0qIujfeyNz8AzaRqU1k5x/xsA3CFWo8/qE1o9V1lxix0HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Re3GQRgF;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2572606A6F2
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 20:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2572606A6F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Re3GQRgF
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b32bc605d9so717793b3a.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795205198; x=1795809998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+C+q5ncc3dwft8pH4Ui5y/gC5sWH3mwGOFy5VnKoiV8=;
        b=Re3GQRgFInWcgf1Ahl6u7Ra8im438UHwEQIp9iC7VIv0/HdZ/3uen4dP9k4SzltcWn
         41KDM8spY3wJ5ExTfduROEXm4U+tQjtPBsUx6e8G5HFFLoirVg3ZugH/cp191BLIsIpt
         t4reyjWpeC47sEwq+SPYVyxAoTAxPKKDFDWu5j6eBfRJGRHeph2SqAbLY9TY4ewyd9uv
         kqjWVL/TCaUa7nXyI1peLS4fKgrh5M3K72/3nSqhDwz1VHoGA1b7+bELBNxL/T355Xr9
         5mARg/5cIhtLPZK0HmYbPmPpQaIF2yjqEUT/j/mZ8pcbVdmdMuk70hWqxAgfhmnOqdm3
         VoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205198; x=1795809998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+C+q5ncc3dwft8pH4Ui5y/gC5sWH3mwGOFy5VnKoiV8=;
        b=a7H7oKe21uHvXCSC/xiBG9z4AWULe/sZBa3m2vX4Zfyfb5EBSBOvShm2xjGIeZ6H1v
         9CwW3CTkwkzLk1pTBoAHxz7fkonMoxmkjJ5SETdGwtVZd+gLFR2htvtLG/HZ06oaQZBq
         vp7J3q9ax8wL5uPmVtnxyRC/pnPbtnpCghIvoJMBFuCSaFpb9QyGfXU++wM0TBI+0L30
         QkoRqlGW+toncx771qmnmc9bWTBVGOhUzqnyez8HQn/snZVqEGqcIuk8pQp3R1+uZJTw
         ZDmLuie8IkSoYT5ce9thPC+5XpkcnMq4JnaQgSnQa/HMKFfRRaqrnUNdG14ulCuAfjtA
         T6BQ==
X-Gm-Message-State: APuU4Z+X5KE0PbV+o92UnXVPJhaxyfJApSjrjmyqxRhbxEw9lSGXDuK2
	CQ3BYSiXM0l3Y7bNa3SpHhHxv25RGIYptvT+dLHF7RUp7O34zZMUqvmSPclo5P07KKFllSRyjfV
	idiWe9Bs=
X-Gm-Gg: AYBFou2JDywm3S9N8baC/SBojKyJUnuTgb9qsHUUitlTqlN5w1SAiO7Mzsy2Zj0bDKM
	lvo8H6d3KM1qhQo5DU4OTcEQF4nhmdW1ORCnVdQ+ZRMeI+hLCIR6or78T1qgK1d0Siz1gitVL33
	4RC/Udbq8lKXYID7OLDyqRooP+9F5y9Q+qTSHJn2Lxr/BdmN6lVZd891sMLMtF54lA6Eksuzrou
	J2FzOIWK6rBqbbrz55qr2OpeXeYyw2So2bTaATow7yLLSU4Im83G27uJl7f5CM5biVqCw9+V+bO
	I8SEkqyuSflJ9uk6bHblkGblGykNsvNcqJHeJizfvGh0WIDLF+/EhmiDse+VhQ3V+sdDOlJji/S
	oWfvYBPmw4gvnFy1MatlygcRtOUPoKeS9RIgeSs7KNYF5rbFsXiAHTJB4i06myyj6OhxKy9/QRS
	DYfoqs1IFn5RMS+4F+IFGqLwdWQT6ZeLaTrOPpwZBjCUC3AiS4Fbdn76vcdFFixpx3/EMBb3wSk
	HC7b3lP06dFF+X9HF54aN0CuExsSPbIL2qdz+9HK4TfYkP3sosLbHtV2gNaeCkSlHa5vURSp+Kw
	afKE2cAqtSE9TdIfGnaTjJLJzNgyXuUdMR040DvajQiXyQT1tIWkp7yqaYB8FNa0hiJcPssc6av
	UI+Dgqtu+8xlc+g==
X-Received: by 2002:a05:6a20:1bc6:b0:3f4:79fa:414 with SMTP id adf61e73a8af0-401bb21187fmr2510018637.13.1795205197980;
        Fri, 20 Nov 2026 12:06:37 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm1619282a12.18.2026.11.20.12.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:06:37 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [RFC net-next 0/3] net: fix route flush for routes using nexthop objects
Date: Fri, 20 Nov 2026 12:01:27 -0800
Message-ID: <20261120200635.95798-1-stephen@networkplumber.org>
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

"ip route flush" fails on any route that uses a nexthop object:

  # ip nexthop add id 101 via 192.0.2.1 dev dummy0
  # ip route add 203.0.113.0/24 nhid 101
  # ip route flush to 203.0.113.0/24
  Failed to send flush request: Invalid argument

The first attempt at fixing that was to modify iproute but
that is just working around a kernel bug. Flush should be
able to be done as dump-and-echo by flipping to set
RTM_DELROUTE. This always worked until nexthop compat mode
was introduced.

This series fixes thes by changing where fib handling
is done on delete. I don't use next hop id anywhere
so this is just a proposal.

Patch 1 ignores the legacy nexthop attributes on RTM_DELROUTE when
RTA_NH_ID is present, for both families. The id is already
authoritative in the matching code, so nothing downstream looks at the
fields being cleared. RTM_NEWROUTE stays strict.

Patch 2 accepts RTN_BLACKHOLE on delete when the alias uses a blackhole
nexthop object, so a route can be removed using the type the kernel
advertised. Dropping the dump-side rewrite instead would change what
every existing reader sees.

Patch 3 adds the selftest coverage that was missing. fib_nexthops.sh
exercises "ip nexthop flush" thoroughly but never "ip route flush"
against nhid routes, which is how the two paths drifted apart in the
first place.

Testing: the new tests fail 15 assertions against an unpatched kernel
and all 26 pass with the series applied, booted under qemu with
nexthop_compat_mode=1. The existing fib_nexthops cases, including the
legacy delete paths patch 1 must not disturb, still pass: 93
assertions across ipv4_fcnal, ipv6_fcnal, the compat_mode pair and the
fcnal_runtime pair.

Stephen Hemminger (3):
  net: accept legacy nexthop attributes when deleting by nexthop id
  ipv4: accept the reported route type when deleting a blackhole nexthop
    route
  selftests: fib_nexthops: test route flush with nexthop objects

 net/ipv4/fib_frontend.c                     |  17 ++-
 net/ipv4/fib_lookup.h                       |   1 +
 net/ipv4/fib_semantics.c                    |  14 +++
 net/ipv4/fib_trie.c                         |   2 +-
 net/ipv6/route.c                            |  14 ++-
 tools/testing/selftests/net/fib_nexthops.sh | 126 ++++++++++++++++++++
 6 files changed, 169 insertions(+), 5 deletions(-)

-- 
2.53.0

