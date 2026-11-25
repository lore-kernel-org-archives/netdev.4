Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570734;
	b=K52WntEu1A44wvfwGA2F+NroipXGQlX+OkDftQ6US1ROh8JQGXWLvS2m5MTzIvLU2iga
	 Z2FdAj+xJAmkfERlZdkVG+nQPe8jL3VYfm+BH7QzTTYXJk3GfDOoh0N5RY2msJVrE5iTw
	 Ji27vbYwW7HY2FM+kzsvs0HHfNpWM+JhPyogMUQD667QEyvANM7btH2R8QbWhBISAP7Kx
	 ArgPq37xjzETpqtXtCIxlwH8hIxWZ6THRCMxycPW6WMPAkbD6vbRjlOOa/BbjRusgv/TF
	 cJG/UuiBf2HB0RCHUnd4MBBFufm6SIo+BMDyc5mOgDoXv0RVlx0MLSJ0pXv2s1jEAuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7Smsfv+fq1upfUo3AxsaYN4ktsEVw/qOOecYxHG+yIQ=;
	b=peUvgPaUtVJ9BUKCEduVpp8vdTqRCjpKH/kB4TcrCcV/2ZYnZsIRKl37RmtHaPHgr00h
	 rD52JZ66F0hcD+v5ZAHoyU1yUue3qh9iUwfm/AJV50KMBhjPyd6onYwevpzcfR2KneZRp
	 eZyoAg9E32KDC0pi0BTASysltwSj2Ii511LIFQgDKjBX7YMa/+VIeiUmTPko7PcYKD1nf
	 m1LdUegG8RZ0QWgt0Y1FDHxazMom/GRnJu69t2Jqqreue1PNFMaZP2O7BGbt5l9mlvQMR
	 ZfMaR89SO5NpQq/618Bm21hT1Dlw8/vaEYwykaG0trTfZMJ/9Lzm/Lq8o6sTTANVl1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y7jI1gpk;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884DA606A335
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 884DA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Y7jI1gpk
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2619554a12.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795570734; x=1796175534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Smsfv+fq1upfUo3AxsaYN4ktsEVw/qOOecYxHG+yIQ=;
        b=Y7jI1gpkknqY0ABHfZKzFcIABUS03xker81+5srIr+qNUBouJqMuwZ9MGkR3nd/Ynr
         k3kM0qHc3j6AJJ/uzkutbfAKaUTzYkvAlTO8bSlrAYQagbHVQHtQHV72XwdlpuczvsoP
         TpXgBf0QQ5Dyi8VNg7cP3KQpzYPtHWTG5wL17e8PZ1xSe9dW9fj9Vl2NjKrfFFBDDv9i
         loM5hjoFAVpdW3lShzwl75H0xSa/TC+GNBqDo8l9I/dk/Ni9Gso8mF6f89ucmB4l6ibK
         8WxmXfdX+LO31CwjayLfg6w1fbizGQ3D1jXtvX1WLalpM+BNozLhn0j430I2a32Uxm1/
         Royg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795570734; x=1796175534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Smsfv+fq1upfUo3AxsaYN4ktsEVw/qOOecYxHG+yIQ=;
        b=Vmrjvhlac18+xaP84r5po9WPrRQP66lTVKRAP06C1W0RRHJY8l7HxaUU53+Ppu1+18
         yNV15vxWBai3uMYP/d9Am2tsxCCuKKOkJrRP22jM2wqO7r8yyQC6+CNgFBu3h0VTlCHg
         tgPlPR0J9NvuaASaGrIYa2N6q4jHPbmhbs6q1gI0MIfqwvKLUjj5O/Bd2kxb7vJwHRWi
         vQhoT2JB2zNY90N3efAdbi+twE5VZyancXuTm7KYk3AQB+qoj1l/zpwz98F4+fZZ8452
         V2hhuy260NUQ9zdXXF3HZxj42869Xf3+jgWDMb4zqKc6fQndrlc2P8i+oA5dbSZ7xdc7
         XYLA==
X-Gm-Message-State: APuU4Z+Exv9OdwgXFS6mCggCouU4TU4Ow83Yxzbt8uEgzESN4+i7W7mc
	r6DO60bituTIjULwGVZsq6r0Ygp2HhVWp8+bjbmDLeAOItm7Jk0ev8isnT3OD3JAWXMorfvCXzd
	b7wOn
X-Gm-Gg: AZFdTZeIBRmFoJmfITrte5rEBI4fPn2+VRP+bau7QLcLW13/2thqawdz1qnam1jf/oa
	CitdsEJV4QGEldP6Lv9Dve+NrmWJvZTXVvsn8mYeJBYnN4WV6RYElmtieHT7r0wxClAvm15xlr2
	zGBxaIppReXNAi/s+JPN4PbqTJuH1uYz2S5XV4hH2yLOKwrj+D89gp0MV6D8TaVGZZXzKVzEAmU
	KynrRFUKGz0jl9mcmnkWftTkv5nDA+RYN8KsNx//dkN+NDeQZqSscbEAdjAJBq12Pe4NwBd+xV5
	RKGcRXWmxMkxmXaU9MwWx70jgMeTp4f3niBSGbD8wav+coWqLEqLvc8hL1DXpT1kAi7eGIxWh5w
	T/65QtDbuwfkerjJ8rdkA/Ih1SaaGesLpd1z7YHibjxeNsxwERVf4EZItcDGVBDyFPoS9z9WJCm
	oEttcAECU4CjCCGQvAocV4zR9+r7tD79ZwA7sywfkqfkH0CT7nlA4mMkBe3ZCZrpJikS2XkpyXY
	vb0XaXEQAAzlyiRADx8E8lUj4ZDPqGm799b8ENeqXpn7+XRV2LecCPmBIR5vcihrT34knfQ1FWj
	kO9ovRr4oM/OvgVC3J385PVJaUu78hlDhxpKEOonqCc=
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3b41c9476d3mr15912929a91.37.1795570733806;
        Tue, 24 Nov 2026 17:38:53 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b82e624sm10708674a91.4.2026.11.24.17.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 17:38:52 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: edumazet@google.com,
	horms@kernel.org,
	narcisav.kernel@gmail.com,
	Joe Damato <joe@dama.to>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 1/2] selftests: drv-net: uso: check datagram sizes at the receiver
Date: Tue, 24 Nov 2026 17:38:35 -0800
Message-ID: <20261125013838.3823834-2-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261125013838.3823834-1-joe@dama.to>
References: <20261125013838.3823834-1-joe@dama.to>
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

The receiver only checks the total number of bytes received, which is
the same whether the peer gets one datagram per segment or a single
unsegmented datagram.

Run socat with -v, which logs the length of each datagram received,
and check that the peer received one datagram per segment with the
expected sizes.

Signed-off-by: Joe Damato <joe@dama.to>
Suggested-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/hw/uso.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/hw/uso.py b/tools/testing/selftests/drivers/net/hw/uso.py
index 6d61e56cab3c..b0936b6b2161 100755
--- a/tools/testing/selftests/drivers/net/hw/uso.py
+++ b/tools/testing/selftests/drivers/net/hw/uso.py
@@ -4,10 +4,11 @@
 """Test USO
 
 Sends large UDP datagrams with UDP_SEGMENT and verifies that the peer
-receives the expected total payload and that the NIC transmitted at least
-the expected number of segments.
+receives one datagram per segment, with the expected sizes and total payload,
+and that the NIC transmitted at least the expected number of segments.
 """
 import random
+import re
 import socket
 import string
 
@@ -57,9 +58,12 @@ def _test_uso(cfg, ipver, mss, total_payload):
         defer(ethtool, f"-K {cfg.ifname} tx-udp-segmentation off")
 
     expected_segs = (total_payload + mss - 1) // mss
+    expected_sizes = [mss] * (total_payload // mss)
+    if total_payload % mss:
+        expected_sizes.append(total_payload % mss)
 
     port = rand_port(stype=socket.SOCK_DGRAM)
-    rx_cmd = f"socat -{ipver} -T 2 -u UDP-LISTEN:{port},reuseport STDOUT"
+    rx_cmd = f"socat -v -{ipver} -T 2 -u UDP-LISTEN:{port},reuseport STDOUT"
 
     tx_before = _get_tx_packets(cfg)
 
@@ -70,6 +74,11 @@ def _test_uso(cfg, ipver, mss, total_payload):
     ksft_eq(len(rx.stdout), total_payload,
             comment=f"Received {len(rx.stdout)}B, expected {total_payload}B")
 
+    rx_sizes = [int(n) for n in re.findall(r"length=(\d+) from=", rx.stderr)]
+    ksft_eq(sorted(rx_sizes), sorted(expected_sizes),
+            comment=f"Received {len(rx_sizes)} datagrams, "
+                    f"expected {expected_segs}")
+
     cfg.wait_hw_stats_settle()
 
     tx_after = _get_tx_packets(cfg)
-- 
2.53.1-Meta

