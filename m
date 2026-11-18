Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991576;
	b=kafE1oZlLBKpXCnmgJLQiAFSAaJJhm8TLKw+RCrzQ0R6deRKPrgLBRTuf9n0LWfWdu3K
	 9r1pbJLdaFBIbFUVagFZt+QXpepAkhWNjj/+8VnQgfFZ4sTBwjpAq638AZwwSFRUuyDur
	 2s2s0yBDukRVk4M/Q2dc9wYIrHi37iRJlH+O3wOsgCC4Gy2p2UKpGGeD+aDTnQhE5ptIr
	 jHYolyHCL/hhhlRrFcmlVlPTDadMRahUeY1CnuNvKX/L0SukgFSFKI2ayrFapIOZXudAZ
	 egLVBDIbiujhltkM3ZE3Q9iwIKQBynOzhdiOGSSo6mcgdK9eAjhep++F+h3lD6Jltqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pxkuXdERaykwMOPQlF5CucoOr0fRF5ezQY9VTtl8AFo=;
	b=IZ5bfNG8+jCgkKlDEg+BnthY91cLv0bvBSUsfUEXbsUAAmRczOX6dDNAxqkeqfImfXCf
	 SvsdXGfOa5KCLFDpGv3yJPrDcw2ozzhMnH+2zwEhmU3kLbU7KGv4H6KO9dh/RgRq9ZkDc
	 i5n2sLIgJqHixtYtEFBRKZvMBUy6pszWS03lIgOXwxT4pQVcTq/Us7ac7/470OF4Lbuml
	 t2maaPe+wxyn/4Nyvy7omJe+YcRL8U9Per/EnULVt8AeRCNKPRbQLUi9/c8Qen9FlgJcB
	 tNOVbOuTl4Fi9TXB+EWKljOYAWOekCWSic8DUhkkyvYhU9DhTAQlDmk420CqygH1OFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpVGaUt0;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9F3606A336
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9F3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpVGaUt0
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso968480c88.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 00:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991576; x=1795596376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxkuXdERaykwMOPQlF5CucoOr0fRF5ezQY9VTtl8AFo=;
        b=ZpVGaUt0qFX+fY8g64e6lfSZ6qDUG93vsf8J1YDKaJ//YYszq+CA7ztgrzDEG9cOt1
         WvUtFbMadc7JV+Vfz7dMqS3VNrppTwPCAfMUqjXCRMf+Xmzn/cA3k1VV6wDRtIFUoHHe
         5C8eDEEk4jKPUr5tDtaRFkBWw320hZjP2fePVtOA3YI1cmnu+KUOcpvS33oV+ermFd+W
         ZopHhKSa8ddS5XUHTfsLuTMs5bAhUqttDM1zqstvA9RmVI5BHbvs/O8JWrwxbOIcN7CD
         JiBGRmgNg7lblyYyO4QFX6Ozuq4O8JFPXGKHT6HM+hy0rII/NvC0J0NskiVWESPU9VgR
         BQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991576; x=1795596376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxkuXdERaykwMOPQlF5CucoOr0fRF5ezQY9VTtl8AFo=;
        b=ax0mZmbk71vLyF+i1wv8979hYZ1SiuPsIOAEFmbjMLHKVuwmUIDE//d9kyiPL81xCC
         MyJPFHyQyJaxQaNTfzhE5pjyRstvw4XAcwebQhOz+NGryqcOYBNldM7NE+avma38HALx
         rqzuFhjXIfNeWbt176EOS4lyX4kaD5dSfw55a1M1uOEfbHjOUbABjYnP406T/jfIR+O2
         J5vnGDHxGv7y0QX7g4tz0/AJap+kL58rVbyRZzkRca4MBMqYee/hDHw/io7zF4mXq7Rx
         3BOScPIJPMU7+4fIPMBUawrmhTLq56zrEHiDaOI8puPDbF0Q2FOhPuG0ag0mk+gfBsHr
         xPGw==
X-Gm-Message-State: APuU4Z/ESvHlvirZ55ZFKlhyYviZqFxqumZ3A/F+FJscTBKHv8S/foHp
	rRVfngKBLWKQix2xKY8MQW7j3XoqZ5J+Mg9WI22OKSWHDcC4+ANQ9UC2UPwkCuqbWrx7va9q
X-Gm-Gg: AYBFou0n6a1S/F8CHoesfU6khwpRs937U5M1F26+t2C24+Aaum5aUjvOVTE2nOgNE34
	rWpCEL8TTxzfaWZVIPHYR470UMn4LjvZatE8f5QkcFlD8p6sCiI5kyZ8fkKl61PJR9kiofpwu9e
	4ShOLymf8CkDJPDENFa5MdZztohNq+gBPRZn3eDKHajjX2yHA/dCErpusSNxWi/F+q4XRCUDs8x
	NH+s7pJrdTN6gcOlmjO+fP11MJBx/UahudEMkdC9VTajuS4uZCrDmsNPiQXHLToZpw7GUYcW6Ai
	B+evsohLKNwnuN7VfuxnPKeHaqDhFf5kslFaTj2HlXVAP5gtBL1qwJ1qiv0OJqHirc/6HKmEbX/
	u9neaEiExqhfpNlIQb+y1pml7jvVr0E9YYgL/hOCD/EUHaxdYwiXkOfwCPu9mEL3Jv+sPguqEf+
	ndPpm46wC1moW0Po8mVGAUA1lEwyLMkR4g200YCZ8y2uzUXjHJag4RDbI21eXpqF9lB+FKre9Qv
	hpkkpEfI/+OnFwlYsyp+KH+EvYbFGvVLGqSkn/gX8y6vuZRn10KQl8iIj8kHokuIHH4zrL7IdCz
	2+01zZxprHsGkITdMkf1uX4RtP9d79x9b4xIeZJsDNku5/p6PUQV7sO3
X-Received: by 2002:a05:701b:4649:b0:144:fa57:c617 with SMTP id a92af1059eb24-1b543d32afemr1728596c88.34.1794991575630;
        Wed, 18 Nov 2026 00:46:15 -0800 (PST)
Received: from zypulse-in-radeon-MS-7E24.lan ([2406:da18:1601:7200:e02b:e41c:8db0:668d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm7220671c88.11.2026.11.18.00.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 00:46:15 -0800 (PST)
From: Yuen Su <zypulsecore@gmail.com>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org
Subject: [PATCH net 2/2] selftests: net: test flushing IPv4 nexthop routes in compat mode
Date: Wed, 18 Nov 2026 16:45:10 +0800
Message-ID: <20261118084510.332821-3-zypulsecore@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261118084510.332821-1-zypulsecore@gmail.com>
References: <20261118084510.332821-1-zypulsecore@gmail.com>
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

Exercise ip route flush on a route with a nexthop group while the dump
includes both the group's ID and the expanded paths. Check that the
flush succeeds and that the route is gone.

Both checks fail before the IPv4 delete fix and pass after it in a
QEMU/KVM guest with unmodified iproute2. Codex assisted with adding
the case to the existing compatibility selftest and running it.

Signed-off-by: Yuen Su <zypulsecore@gmail.com>
---
 tools/testing/selftests/net/fib_nexthops.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/net/fib_nexthops.sh b/tools/testing/selftests/net/fib_nexthops.sh
index adbec51..d3c8cf8 100755
--- a/tools/testing/selftests/net/fib_nexthops.sh
+++ b/tools/testing/selftests/net/fib_nexthops.sh
@@ -2183,6 +2183,13 @@ ipv4_compat_mode()
 	stop_ip_monitor $ipmout 3
 	log_test $? 0 "IPv4 compat mode on - nexthop change"
 
+	run_cmd "$IP route add 192.0.2.1/32 nhid 122"
+	log_test $? 0 "IPv4 compat mode on - add route for flush"
+	run_cmd "$IP route flush to exact 192.0.2.1/32"
+	log_test $? 0 "IPv4 compat mode on - route flush"
+	check_route "192.0.2.1" ""
+	log_test $? 0 "IPv4 compat mode on - route removed by flush"
+
 	sysctl_nexthop_compat_mode_set 0 "IPv4"
 
 	# cleanup
