Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794715580;
	b=Q97jHT9q0Jvra+SeuSUhzN5feOK3nAQ3LjIcdGDy6Pa3K1OwlY+Ve2nssx3Rhy5ExXCm
	 XPAhR3gCPhJBg7LlrmMv8xjF4AnLeEfQbV036V2Mi2d9CkGBSvqYwTcVsu0+zaNNNSKZM
	 MRyizd06qcPhWRBuKip4nlnJE0mZJnM7Sr02RmdTeCw7eOMmAqG9t5haJoZ15yhH089jB
	 N7EAJb6C81covY/h5/5XlrmU+tryhMJl5ARNBfxof/MrE+6/b3Cmso2UuzwzuzlSrRsCe
	 G1sKSZt4TR1ICB5h3X46D7MTRcHhF39gREyRRr+a848s/N9hjqfM02a1yNObZV8xEqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794715580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JEym9dfcLV/JoHBALcPP+1Zb2oIRJDxXQAWLI+9icsg=;
	b=YndwwYRTt7efrqJh4KxrDfVYZsgn91+nFCrC0FR1MUyISxhLtLCtS/mm0PbdqfQgBKTL
	 GXC5t2VN8ZkseTnmXWNRPKVOeuyBKZevgz4zhvib+Y4l+KuGG0XpDUAi3NsIKJBUzq1TS
	 2FHHXfmai/jHN1Ewc8i2+7zqN0NoSN2kRjLQG8zuVuYUAyZHYAqtj0/Yoe77FoQczm/tw
	 i6X7LFLLBknFSUcaj1tL45X+0fYoc/mLuBoi3r8dCC7GUpFZXjN6eo7DaiX0szqOnE9Bj
	 zZQgFSOw9XYcx4hzxrJ/iZkoW3f3J1RnCnohmMTAqCfK6FyWJdF6zRUEyl4j3OkZVDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4zU1GlQ;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B5E606A323
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 04:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1B5E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R4zU1GlQ
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so890479b3a.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 20:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794715579; x=1795320379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEym9dfcLV/JoHBALcPP+1Zb2oIRJDxXQAWLI+9icsg=;
        b=R4zU1GlQBzXZWwrmjfqjapkMcX+qoh4We1wBDnBv5+ydsBVRONNW6/EpHcFzIymZrk
         W1RXyPvmqBFPRZKdg4hgJA+oIWFyte5LLiNbbJRxHb8EY/oGZSmLpoZ+V9IUbGpAFHzP
         EchyJ6Wo0tHSHufIvDjjH7AUtaFtCRdwu2TsbQWhHxiJCK6YSYZhBKMRTTbGKszmVevp
         jKFuCKV2InSbHzbqWpaaQ+oTRpDx+3l4Ev2qfzgaU15MQXWp+HzO2Db4dDCMEgqyM3tU
         pzbyP81jRUqT92vd4B4bca0qyczrV4xJFESfwbX0E0MBGtki8CIYDlHXWSzRW2MKaeFq
         l6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794715579; x=1795320379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEym9dfcLV/JoHBALcPP+1Zb2oIRJDxXQAWLI+9icsg=;
        b=d4DD73nq4mY/CcLPZJewLG8RM8PhgtSQCzlyTNgHHCQGjnQZD7kVjx0jbHAQAqsB/Q
         CPphCQm4hhaEtFiNlldSCQy/3gfQz3CCqnABM99kh/2Z4zvkLRFd9wXhoDjEPvmTXDPj
         GNIfMGoOgZJM+396yPh+QF3pzO/6kXVxJ3v1PU3fj7neB7ip+uAygDS2wHwe3bgNabwl
         B9U2Scn3qEc34fDxCTNrYqaaOA7u5VxmzQFQcSJkxZ27GCAlWbIDxqcRLr5h2nC06pxN
         jpPTivjGE3srDIr00CD5UWATpZ+CjiPYbx3OCmAWiD8HkYU9kS1O9fkZF8CwcETOsELg
         fj1g==
X-Gm-Message-State: APuU4Z8Pmx6yXsSHXnWwsBhKZpumnbD0T83ehyQ0iyN8yUr6tz7q0aml
	AddywLuNewd0oSRkX8tYQGwSEx/w1d5rm+R69kfnBFFU7FzhoE1ktEm0mopS1fXslak=
X-Gm-Gg: AYBFou0j7fNqcYXTGaZ9l9OXv05zZMt1srDF4v//4GgbyzTwlsO4pB64LNDTRiAL+NT
	4hkNk+PZ/IYXL6pCXoM9n09hflp+jXoIA7xboe1UxMMgTxPPGKj5GFtezS5i4bqaOXQxt9xE/Fx
	xPHYjqlJx95p/NJE0agl6BOvGPH3rkL8oeydCFRWpAAjVC2jruPYb+JIXseMJOwuitgbF50/BnB
	6yWrwMJxpthKXSQGaw6qfsE/BokW/THG8TjBo5UeIrYeQMocYxTF5NsjjxSzQqRtXj4vpPiqjz1
	pKqIcNEB7SPtXxKd7FjwOdifuiShiWAa1M7VCYyzNvdSkXlAqAd37CvTQWptlw9puqvwG5lN4Xc
	KyKB2hvtDM/EartMmP5tcWsWE9PrudqMkJcRMUVgrE5o7vzLZ+hW28BXpz/IUl0uUGPEcYJaQxx
	en+qTYCpso7v44rlpZzwxZMyN+zBiRM3pC4+rI34PuFapLGifzTobrgioLwYiFkq6/ZvDSeIEJz
	U7Lq3gldXwWpRE6rpiKEZ00gVDaM0+VWGLgefKVilTc7IfpxbRL4hkKiVemEy/XzA7yk7ljs4/S
	YW5RclsfwbKW6hRmLDQs5lgEjU6D+tDM0XLxfL9wlufru0gvCfsza6868wvhvce+SMG24+lWb3X
	AzjU=
X-Received: by 2002:a05:6a20:b78a:b0:3eb:afe0:20a6 with SMTP id adf61e73a8af0-3f7a72b98d9mr6323697637.21.1794715578825;
        Sat, 14 Nov 2026 20:06:18 -0800 (PST)
Received: from localhost.localdomain ([116.88.205.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a8682sm2485668b3a.10.2026.11.14.20.06.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 20:06:16 -0800 (PST)
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
Subject: [PATCH net v5 0/2] vxlan: reset the remote's dst cache when snooping moves a MAC
Date: Sun, 15 Nov 2026 12:06:07 +0800
Message-ID: <20261115040609.61134-1-ilskdw@gmail.com>
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
the remote the way vxlan_fdb_replace() does, and compares
remote_ifindex in the early return only for link-local sources, so a
"via" device set on a dynamic entry is kept. Patch 2 adds a selftest.

Results on net with 1, 2 and 4 CPUs, per selftest case (move behind a
router, move to link-local, via kept):
- without patch 1: 0/8, 0/8, 8/8
- with v4 of patch 1: 8/8, 8/8, 0/8
- with this version: 16/16, 16/16, 16/16

v5:
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

 drivers/net/vxlan/vxlan_core.c                |   5 +-
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/test_vxlan_snoop_move.sh    | 199 ++++++++++++++++++
 3 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/test_vxlan_snoop_move.sh

-- 
2.54.0

