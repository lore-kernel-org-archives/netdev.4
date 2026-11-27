Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774973;
	b=3PofNV4Q5YirSDLGkZ3hhVVpkjDoqa65OOXP68bPglRHFAn1GF2W/NM2DQGb1ZJY/Plu
	 oGyDWSb/epuxak5oGsPe/ulu1RFWr7x1LIsJp98670lh5oKqMSnOLm38M1SYDVhzk9yr2
	 foe+bRN6QGNLlITWdPEAmvNfJe4jcT2YfMCW23ysHBDm0KUdlzzUTIXo8QrqvhpsN6iCz
	 8SdpKtYynrYXZggSmH4XWuIBgJNt64wSjQ+UOElxSGDmi0etpFAR4hydVv/YJUE1Mtz3p
	 l0wjL4I0/82UvlrxF5KJlMBi0HC1zXTw6nqJLdAsO3zlH8DswxQjc0O54kFgP3YBgJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7jTZ/KAYP4zd4AjB9WmJy6KqD+4+vtAh077IXDg85bs=;
	b=zyP9HS+T/xEp4mOzX66cneU/ESy87sXPME7Gj4InZeAtpL2LWINPXpNjvNdmpS5lilws
	 QMYskg5XkOzBNh3K61qmt5/8nnkhoqv+Q+7jNI4spkyovjkUJFjs6AZhEjlrcZ/H5FcOR
	 xAu1Wu37CaQk4XEBalLP7c1NTlD7Z3t5PlJIGjvo9qTgigxIp6CJE3/j1z1K7JR+ZdISD
	 ZjHrAhVgMFvQ/7AYseg3050sEo9TO5V2IoILduVXvhYUYxXZ3nXigLn+TMOs7G4RcaAF0
	 6ZUaPNZvfGj8LVRfg6VIJJ+pNkA/2sOgquHMrb+2mTklPtpt7IwiGy5iJpPkjozJy4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFPPTm63;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8457606A33C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:22:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8457606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFPPTm63
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b86bbce3d1so10686754a12.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774966; x=1796379766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jTZ/KAYP4zd4AjB9WmJy6KqD+4+vtAh077IXDg85bs=;
        b=BFPPTm63qo/CUmMUDO1sfX5o0I/6GwrjKcaJEq+rQWc+u3CQzW7axT4++sgiLHziHA
         lUiWtEHkhcq7ZCXOkv7AgWNa40ikJRDt6AJJaZOP13WNhfen5KIC22dJyGBbxHrqQsPl
         nriNVshxLF/yFFNUeCEVs5HqtcN+Jd1Fgkotx0M9QHnw2VDeV/UewNqSZZ59gv9irx3A
         2c3hZqPiO3L83M2EAE642cxPNtJpQpGL+f0LD0DGgQYYzfedsvIFik/zrA3F5dKx/IlL
         CmIr2VkXUGRh1asp3QgZlIAPuFNZIBd+CkzRAvo7XZWBVX806S/hOhZkPdh9j3jreGzI
         KvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774966; x=1796379766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jTZ/KAYP4zd4AjB9WmJy6KqD+4+vtAh077IXDg85bs=;
        b=HIHLcJUxGINykGOlzfY0dBt2wKdfnfbrZI+LS5N9zPgogCqdluyDrPLSwfYln7ssr5
         0DvMgOhGCOYc3lTvJIWGkdRo+o/zRP2O2Mw8ktOWkBD+GfSmV/Ef0AkouioZsBtCK03B
         mif0DO2aM4flf9jS6zy93/CxkyzqFT+gfqwf14g2M/3/ooZoxwLOZ3yUsQFB2oaPe/7B
         kWXnbM/AL4yZ4TCJ2fyHWy1M95AhIVY8Gjdn3argBz25kV2A52Pn9eao8VKnqzSiiaaD
         /lr9wP49rzHQTK4cFzMVU1w0bmVxWFpEf6P646F5BC1rw8IUH5hILOGww8nsHoX/TE/f
         KW4Q==
X-Forwarded-Encrypted: i=1; AL+hErHwS7+1bjmB8viAOb+z7KwzRWR1ZPXbn617l4I3NDaqXkqcxOQcd9WhcGh7e//ZtPht3BRsaSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CLMgQmHd4x3yxD2cd+Bec8GLX3I5N6n+xZVYUQffjsVLZzppR
	yyeIUKDlRViIyZnXGf4PudgHS9ZDkwjGyIYHE7ywPMrY4ut1kKq8IJ5m
X-Gm-Gg: AZFdTZeqGpY4lib0IyXETYoBlDqBDgjKHXK57Y1W6K5RogIdcObGojWHp3sTsjaNDtk
	QgyoOI73ES3wxhZB1bTjT6H/A4/gmKbfAQTs3GOWbq7V2OY8hTUaAxO/3NuHqwdFc53Y07ke+MM
	oswJyo3s2Yr6v+1SQLRLi0BknhpSOKYBjBdb2pk/mJMmgyeqs0aAoH7jfUoqghSoMKK3KzqtNtl
	TeZeDd7GKrjKWR+5LmTHpmI+ubJvCYjGDzGif2sV0m6ZZWRcCOJn/ky5oprHx7RmQyWj/kApQGw
	tgP50WtgFCOpNJBsbKsrSCIkfU5K5K4mdaP+hl7eLVHspRauFYGZ78PSM9K2u+ds/2NIqO/HBXr
	dq5EF3wUsNfukOrbrCMyZInSX5HyRgEGCPZfb0HyYZnUnPB+W9CTPk2DVDf1suUuBiSSMeYP33M
	shf3iBAkgUHjHBGoL1NmKprXxy7YrfuOqpUM01zrZ0QhlJiqw/k+jUDz45MKD2GQe3xEatV2GIG
	bYUFn1IfFRNvrug2ulhMmqLZykle8iE+k8YwJuc9IELPzGG/f4inL9ZMj/iOeW8eUFoYUdcpOd+
	ZkQJsfg0uTjeMtFRB5Ae/1mY6ygsgUbJPp+Y2VJODcy16zRQ
X-Received: by 2002:a05:6402:1e90:b0:6b7:245a:a509 with SMTP id 4fb4d7f45d1cf-6ba37ebe297mr15514613a12.40.1795774965920;
        Fri, 27 Nov 2026 02:22:45 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm10886407a12.9.2026.11.27.02.22.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:45 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] wireguard: free receive queue packets on peer removal, and test it
Date: Fri, 27 Nov 2026 12:22:41 +0200
Message-ID: <20261127102243.49405-1-apasichnik9@gmail.com>
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

Removing a peer while its receive queue is busy can leave packets on
the per-peer receive queue. Each of them holds a keypair and a peer
reference, so the peer and the keypair are never freed. Patch 1 frees
what is left; patch 2 adds the test Jason asked for in the v1 thread to
netns.sh.

Tested on net e9e45fcb6 with the WireGuard selftest VM (x86_64 KVM):

  both patches, 4 vCPUs:                  pass
  both patches, NR_CPUS=1:                pass
  both patches, NR_CPUS=1, 200 removals:  pass, nothing leaked
  patch 2 only, NR_CPUS=1:                fail, a peer and a keypair
                                          "merely created"

Changes in v3:
- Patch 1: purge rx_queue only. The tx_queue purge in v2 could run
  beside a transmit_packet_work that was queued during the second
  flush, as the Sashiko review pointed out, and it was not needed: the
  leak is on rx_queue. The older comment in peer_remove_after_dead() is
  updated, the subject follows, and the commit message says how the bug
  was found.
- Patch 2: CONFIG_LOG_BUF_SHIFT is 21 instead of 20, which covers the
  worst case of the loop; the commit message says that NR_CPUS=1 is the
  configuration that checks for the leak.
- Rebased on current net.

v2: https://lore.kernel.org/netdev/20261126094722.73025-1-apasichnik9@gmail.com/
v1: https://lore.kernel.org/netdev/20261003201625.4572-1-apasichnik9@gmail.com/

Andrii Pasichnyk (2):
  wireguard: peer: free packets left on the receive queue on removal
  wireguard: selftests: remove a peer under load

 drivers/net/wireguard/peer.c                  | 25 +++++++++++++++++--
 tools/testing/selftests/wireguard/netns.sh    | 14 +++++++++++
 .../selftests/wireguard/qemu/kernel.config    |  2 +-
 3 files changed, 38 insertions(+), 3 deletions(-)


base-commit: e9e45fcb6d39bee9325e6a7dca72bd14e82760f3
-- 
2.43.0

