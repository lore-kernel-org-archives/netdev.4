Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686451;
	b=V/d0Dw2cMnKeVGuSmogJMlYZuMh/XNcTnyqwNKbCyw76CWhGk6oV2CVEvosRuaKIMLK1
	 aMJtfRp8lpw0v21JdHxrYsxRs+cl390j+fMZfTUPK/eavpAr87q6dpylNQr9ZVJCB6k5g
	 HOjGaZ79oTkD3rTIBLBosK6CgQMh8txq3gv0TeOo9tfBW/6WJzeUxKDyoHbo+kLJCcge6
	 2XzpChG/mKIynHd3wZHDDJ43Fqvoga7rqBnHYE98hixRVXBIG5WbEVrMR6U68LaG4Dz08
	 vHvpZLbkn9qQIWzfgRVPWDdR5O4NiOl5UZMcOeldCRBRmElGSCnEAwzSaSX2J4+bgnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XpcFE5yH6jbDnsuHPatF5o9jlPyNmnuNxlmeldGFfP8=;
	b=2kd65vURfJjcI0ezNOI2okawDA0nm95YdW12vjUviGjUJWtM+Xqtd1QtW5WeWI6VDsfV
	 3+DfK5aa8LE+nezgiD8CXsFIkRXjMJv41Ip4EKz5hHKpCXR7I2wxa+hnQ15NY2Ajn077R
	 ChAbRTyU2lm3LH2pU9SxpRif3r2pGpWGAORZzKxPgrcSKmXe2avtzjMF/wzLVHF0jLyD+
	 McNg/fnbv4ujxUziAQnOoon0op1xqZHZIxxbEE3KClg2GuW7zhIDBlNilKSaBr1M3FEx5
	 0bq7o0Ec3BLpgl6kVZrvocxWCgvbMkSB0QETgIWABNgWgOk4Iyx5b2RO4xNmzKJETeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pz1I274b;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18359606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18359606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pz1I274b
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50aaad19fbso747991866b.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686449; x=1796291249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XpcFE5yH6jbDnsuHPatF5o9jlPyNmnuNxlmeldGFfP8=;
        b=pz1I274bb3JaDemNqdR/CM9tzxoYeezTS5nspEjuTcafiXkOaJI/fb/2vnsSbPj4My
         SvvEZ7qer5UbPKQ5Byb9/P7ZnOOmKBxO6K4R243EX4v6+VT8IHfPWE1FM9l+2clwjVfY
         Bm5RE5HL3QgzksJR1Bf5FumtfQL46zsoSpW6KBrzDWpkKCdh0q7qRj/A56ZAUcICyjCA
         Yar5CS3AxxByziQampabUDCXhYQwEbJPS7c9fKtDQttD5Z04b++4noYTZ0ICA+YZw35I
         2rDfb4MHI4fEf2CzHl0JlnjMM+tpg7/cv56aFbGENgheb3yrwo23tbefAX7d1rS7GfFl
         6i+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686449; x=1796291249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XpcFE5yH6jbDnsuHPatF5o9jlPyNmnuNxlmeldGFfP8=;
        b=lOe46dyB9qqOzKhdVNZ4gvAMti7h9/r+QdJWBlJQe3AVcNojzl7TImOCqNJ/c3IzUY
         rJRkD7FmtdtpKeN8M3IpLgHiWj6wRyhRH1IhLyPUqLTYPnotzedjzcNjAH8oHlvixYvr
         dRLAglMzuMUcLgAtqqFZqH2ORDQFm7N35d0TtC+PQOYB1nrzIfRC+lIoGXCKiSW/+t66
         bEkhUs5yEdCVvWFLPwhJc/f+uYc86Y8kVty0SqWNMgIoK5YA9g9G1dfg6lTvxecF9NDH
         YFm1d0AHudNCV6zaBLVyu4+FGiBQIM26ta59A4aoFTkJultnJjUbQzeQURxfEj2mjm/Y
         DDNg==
X-Forwarded-Encrypted: i=1; AL+hErE/N/gGdz5owGRv84JKI0Yh01A/ymr4t+0PRUrfTqK4PgpaLQLduemn7nJc1Tw/L/yyOBTBImk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IAGCHyjUkoqH7IvcIvEbLnLc6x26F8SxJF5nZ43KUIqW2q4MB
	rPby4QpB/vw1FU9jtnZ/6uGHeeJhI4CEPNBrsonbuYOjM+FXLChrR9HpSux3fCfQ
X-Gm-Gg: AZFdTZfYU2kf6k0QmNw9OxrJYrjnRH17aMqguw65zksNNWBm10mPQksjRYzb2y/oe6c
	FVJAUZweGBlFt5n7keiLwiFo4tDsRuAryesh/EBtk1MDkUCmF91RRSBX5+NkaiaIeDJ/Svc7pAc
	gOQVGigVpEMX1mQv2xB3Mw0SnyWlZs8G/BKJzgVQLCEImsPAwrC0p52B/Mz95PSyf0Me6hPBbwO
	SyzA2G2hFPbh1vVDguCa/eSOIQSmKJoVx8u+I3B4WMx28V8J7Vdji53W7WOUzp0OVupffFFgCrz
	gMezQDd+QKC31R8sJWHlS/FBPFWGBoU1EjQskaAS8R/rMlDCTJEAhHPCm6Ief5pFS0rKN7kNm7Q
	on6wVru91zJoCGG9sJIXIFnxeYrHX4/5UvfbOTYZqrVQ3GRS5LIeIazePEokiicneRMwB5T4tnf
	fpPmRm97t3CW35DM+JeF3i0L98c+c4bGVqak/s0a24kU3nTKfYQ49xxJE892MGPPq0oxZhETLDj
	n6LvYSs09a2MZZSgQRRv8RFwJ6VaoCUZumbGsdKqrrZlRVM/5uFOBfEbEvOCxqnTLLY2QIcwM3/
	YjPmd4vGLDUlUM98QdUcc5E/QUsVFqaQD360+U0yqOASHD76
X-Received: by 2002:a17:907:3f1b:b0:c51:5547:1771 with SMTP id a640c23a62f3a-c5155471892mr1472031966b.13.1795686449194;
        Thu, 26 Nov 2026 01:47:29 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm727100666b.78.2026.11.26.01.47.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:47:28 -0800 (PST)
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
Subject: [PATCH net v2 0/2] wireguard: free queued packets on peer removal, and test it
Date: Thu, 26 Nov 2026 11:47:20 +0200
Message-ID: <20261126094722.73025-1-apasichnik9@gmail.com>
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

Removing a peer while its receive queue is busy can leave packets on the
per-peer queues. Each of them holds a keypair and a peer reference, so
the peer and the keypair are never freed. Patch 1 frees what is left;
patch 2 adds the test Jason asked for in the v1 thread to netns.sh.

Tested on net e50972666 with the WireGuard selftest VM (x86_64 KVM):

  both patches, 4 vCPUs:      pass
  both patches, NR_CPUS=1:    pass
  patch 2 only, NR_CPUS=1:    fail, 4 peers and 4 keypairs
                              "merely created" in 10 removals

Changes in v2:
- Patch 1: code unchanged. The reproduction paragraph in the commit
  message is corrected: the first reproducer only put load on the first
  removal of each run, so "5 in 2140" understated how often this
  happens. Under load it is 25-40% of removals with 1 vCPU.
- Patch 2: new, the netns.sh loop from my reply in the v1 thread plus
  the larger log buffer it needs.
- Rebased on current net.

v1: https://lore.kernel.org/netdev/20261003201625.4572-1-apasichnik9@gmail.com/

Andrii Pasichnyk (2):
  wireguard: peer: free packets left on the per-peer queues on removal
  wireguard: selftests: remove a peer under load

 drivers/net/wireguard/peer.c                  | 24 +++++++++++++++++++
 tools/testing/selftests/wireguard/netns.sh    | 14 +++++++++++
 .../selftests/wireguard/qemu/kernel.config    |  2 +-
 3 files changed, 39 insertions(+), 1 deletion(-)


base-commit: e509726660dd06ce107437aecf7c106c9d3fc1e7
-- 
2.43.0

