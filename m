Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081983;
	b=Vb7S0bMamM9cTp0aEiA9vHVhML2LmYMF3uFuxewsq93zaX91UEH+Z0Szk9YmmKXcn9XV
	 n+cit3LwoEfbeChREHIsJgmrm6a0rgbjXmiZmlvKIP8DHXjT5v22NVXh9hsNemEKddnLe
	 TLqXMb5mSuoRJ0pSnGF+GN+Qi8sJJL0kbd/JUbtJc/Q7XuHsjV9SsgokbrRW8uxEvcT6d
	 dOa/elitOp3+Szk9Usr0COsLNU7UjC8liG4uI5Vy6RCtAVsqbL7W9QL11DgA7nj1TCqAy
	 cHEM1ZNIDaUYuKGOza/nnaC0qkADNJFIL4hP8xeib1JjVUPpXjOJ2tUxlgGkCp1X+kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EgNLea8vZO6m18gQw1Vww9H/46h/BYth1Gj/oZAEz8o=;
	b=PNdAEFv3gg54EXL+/EMo5+akGuH+uhvG6hLLWl7ER8IeWZLQ8Lnio5hSRorp96KD4jfR
	 4KAnU+tXctan36Ft3YCNewQOH0+hhyV9ibuzhNEyvvpN+Xi6UYQ7SSdVpeE/VsAD3YlXX
	 vilCTKdDxBpIkAP2exT+Vkb2fLXtAGT8Trg4VouaUHsA9++895s5vkzSAne+bdXVvMtNB
	 KXFFxMvMaTLOYqmcaU8PDCS5IcpuRPjiJk3j5o0zhK13ABQ4Re6pGSCmIAsNGkaA66/4z
	 VZQkDA18ziVvHcSj0PSh1loWoVqZ9Qsnll52QmdFEGzFJVnGk6gyZM2RgdSDMCjeifg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EaCQQp1S;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C17606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C17606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EaCQQp1S
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1438d9363fbso332895c88.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081983; x=1795686783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EgNLea8vZO6m18gQw1Vww9H/46h/BYth1Gj/oZAEz8o=;
        b=EaCQQp1SGNgIq0h2I/HDc1TcyiWT5R1jSfv6KltPDpAxVK5hGpm3kIi27ruW+0xAtf
         WAw3l+B1w+EmmhzGJBlgxdPmOW5Uz22LoZJGHOKbuw6UBY/ovrxR1i3OFRbq9xloURxZ
         m2QE9rJiR3Z+Jwvek/MbbnOaRrIuTPgsYkfNhcWrv1r/aPdyNc6kRzxTVKrWnCj9gCj5
         yaNa4LTuk1rOOSxLmMRND31aDwQsR1XFyc81G6wgQ3Lhh5le+CEDsItmLPNa/Bt1YoBz
         vP9otV9x/Qw1POQ/PLVTnDNnbe44DaYAS9Qlbovn6t8kcmw2dY0AzBW6o7hzzYCwqWO3
         YfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081983; x=1795686783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgNLea8vZO6m18gQw1Vww9H/46h/BYth1Gj/oZAEz8o=;
        b=VNgaOR11b/z3EzhMdA28KGYDOhbBZLdI7TQLnl6o8r6xEn73NilPr/t/0fBmvDDFLp
         VqROIj6Y9iqRXn5RySOSPfVGj8EwFIIAfySRbfhiYEJm7vQQSohaK7yCl7Dsz0ro9Ws+
         ZHgETv5xa86+plTVJ47Q24cLQFOlaeisM1g79zCWQEmMgZqr+RGVMlChQN9am3RQMzdd
         Di1VZc2xRPyJW3kBynwf6pm0mBBLT94HdDjt4y6e3BDi4tiTPttUzQ0Rt9y7RjC1t0gU
         fuqcXcQ/kta76qQRSy4BLS91QpoPizSwdADDy87bnOuHBZUcCnZuPqsgZt2PMbMJf0HT
         mETA==
X-Gm-Message-State: APuU4Z+/aXIXou87f0h3RUCa1H131Rui3yOPZsIbgua6G6diobEItoeh
	EcfOySagPFWPfN+S9HdXUFvRIIEWgSs4Ohqph0VpSOukp2pPKzZnpcphR4r9fj12
X-Gm-Gg: AYBFou2EUw4ADGA9uSQfMWQ1/mfzKzTcQG/VPQclyVnP3nN+qfBsWcDzP1G0a0e0PE0
	bD8Fehc+S+nnvTz/9/XtUgg2YIq141o9yPq822koC9vFpWDyq79mepA7TAcZEXShunW/fiIz0eE
	L2i/w++J4GJv0unbz5winxh9uwM5JdM6dGRMi3KJeN2Kyv+NoR0wwonL5+nYyKjO+woLYGcZIAx
	8+PgCrTgsX7nIcmBkmlSk57yaaRGjve9Eb8JNasnRr7CipPIGrcTAE5UIcRlb1cgxvdcNIaU5t+
	ssFI9PagcoF2JsyJTzY9fS4Z4geem3NW+xdE/BfsiTZEOlL642kO797bG/AvM3O7xjiRwueByAq
	qJFKFI8dZgnl9gsHGhMFrnPI0ATqI2HdIEpMjGVO3NNw+LTE8pnGNt9p8U6YY54IVhB29tglE3t
	CHVRrBG17YHi+0/UeEelc18PLt7kvenb3LFoCLDIopPMomkp6mXmuwh5zubT1ztxul22WGwoiTp
	Mj0+Iq+7U3u/MnbhX/MTN3W+oyWoBl3GTkALA7+y+63DZ97DAmJxUZp0xsfXhsri5H6FHwg6/f4
	HCs5yd6bk8aNQm3aP/iCR3ubpDbwg4JzQqGJTh0Mx9OtXuv3gZXmkkdmHCfKeT2OJW2OufaQujm
	fueqEbtbClXDSmQtMgt6yqwNs
X-Received: by 2002:a05:701b:4588:10b0:1b3:be0d:696c with SMTP id a92af1059eb24-1b5520d7006mr494326c88.1.1795081982331;
        Thu, 19 Nov 2026 01:53:02 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447c5b02sm12862850c88.6.2026.11.19.01.52.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 01:53:01 -0800 (PST)
From: Zhefu Peng <ilskdw@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	kuniyu@google.com,
	mschiffer@universe-factory.net,
	nicolas.dichtel@6wind.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v6 0/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Thu, 19 Nov 2026 17:52:54 +0800
Message-ID: <20261119095256.42005-1-ilskdw@gmail.com>
X-Mailer: git-send-email 2.54.0
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

When a learning VXLAN device snoops a known MAC from another VTEP, it
rewrites the remote's IP address in place but keeps the remote's
dst_cache and remote_ifindex. Traffic to the moved MAC can then use the
route cached for the previous remote and be blackholed. Patch 1 updates
the remote the way vxlan_fdb_replace() does, under vxlan->hash_lock,
and compares remote_ifindex in the early return only for link-local
sources, so a "via" device set on a dynamic entry is kept. Patch 2 adds
a selftest.

Results on net with 1, 2 and 4 CPUs, per selftest case (move behind a
router, move to link-local, via kept):
- without patch 1: 0/7, 0/7, 7/7
- with v5 of patch 1: 7/7, 7/7, 7/7
- with this version: 14/14, 14/14, 14/14
- with this version and CONFIG_PROVE_LOCKING: 7/7 for each case, no
  lockdep splats

v6:
- update the remote under vxlan->hash_lock and check the entry again
  once the lock is held, so concurrent snoops cannot mix remote_ip and
  remote_ifindex (Sashiko)
- selftest: pin pings to an allowed CPU instead of CPU 0, skip when
  setup_ns fails, and drop the CPU pinning from the IPv6 case, which
  does not test the route cache (Sashiko)

v5: https://lore.kernel.org/netdev/20261115040609.61134-1-ilskdw@gmail.com/
- compare remote_ifindex in the early return only for link-local
  sources, so traffic from the same remote no longer resets a "via"
  device to 0 (Sashiko)
- selftest: add a case for the above and keep lines within 80 columns

v4: https://lore.kernel.org/netdev/20261113155133.75090-1-ilskdw@gmail.com/
- add the selftest (Nicolas Dichtel)

v3: https://lore.kernel.org/netdev/20261111180001.2475-1-ilskdw@gmail.com/
- use my real name in From: and Signed-off-by:

v2: https://lore.kernel.org/netdev/20261110153020.9635-1-ilskdw@gmail.com/
- also update remote_ifindex and clear offloaded, as vxlan_fdb_replace() does
- add the IPv6 link-local case to the changelog and a second Fixes tag

v1: https://lore.kernel.org/netdev/20261106144406.66035-1-ilskdw@gmail.com/

Zhefu Peng (2):
  vxlan: reset the remote's dst cache when snooping moves a MAC
  selftests: net: add a test for vxlan snooping moving a MAC

 drivers/net/vxlan/vxlan_core.c                |  59 ++++-
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/test_vxlan_snoop_move.sh    | 222 ++++++++++++++++++
 3 files changed, 274 insertions(+), 8 deletions(-)
 create mode 100755 tools/testing/selftests/net/test_vxlan_snoop_move.sh

-- 
2.54.0

