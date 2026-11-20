Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795187187;
	b=tpMFZrv4IwV7GDC9uSB0Wrd+wGqtJReL71GafDOd7cZHkfBDkhX/WfFMPD3vL+gO1LQM
	 nnZmau4aHC8zdiX32bnQ7T2/Ml0pJlLxI0QD7t10vf8hnlTrFVt293icBK7s/opN6mPSl
	 OKBzIF/RAAa0+/xxiXEsDgcsMepxvPaVufiLttPXtT3puasgg3Hfehjes7wmG3b7hbQ+C
	 ega8AHtpKXIrYA+csP545hrbJfwZTojUYH7k29pshH2wF2hpK8hfUexALPSEtKGvlnlX6
	 R4nZX/lbLwklU6Jm9uj4iNj7KGeqbCzZz7joLEfrmZaraE77ywI4L3A4zgxWNP8R2aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795187187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9Q+A2Pm/lTzn6/74RcxfPC60rEW9xoC4OYcN2wFWBNQ=;
	b=3CZRzsYkYSH67rB1mn3WxiVwZiRHju/x3FhSCPt8aayma0hdlXkGbup0s/xLvYdxmZl6
	 2cjoC7qgJVsCUVkUHSgiFCUFANOhds3Gd4051lzp67ZoRAbCXFFzvlOE0/NKsLs37mpAc
	 WSwKFpba/jH5XxCoUwIKBElyu85nO+IJDzN7K1TVMdk8oHXEw/QghNcfHTXQFu2nwrtC7
	 5keI8Y4lt1+e51HNjlse339/iZhTdkXreiT9eQyosWJ3SfzpEMeqRgUZIZYoSbU5Nm05R
	 eiVchHldu9kYmCnzrC9ZG0HQC9O6zpGF2aIIUBBhlMApWnzQHA2QqX3sz5Oi0cogEXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7sxnoxR;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0FF606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA0FF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z7sxnoxR
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3ada81853so1131993c88.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795187186; x=1795791986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Q+A2Pm/lTzn6/74RcxfPC60rEW9xoC4OYcN2wFWBNQ=;
        b=Z7sxnoxRdpdLlw+cEkND+OCe/Bd0Wms92uOSv/+RsFB/+Phud1KUC3aAO8qMx73kxi
         CkA7mb1hE19lBKtTEIX+s1YI8Of2WleXOj1JMTo/hZ82+4ApM6qAtW6o0J6dpbPbLbif
         xnBtOFsji6djS1KED6yKVUkkalD+XQZVXne0CYk0CvFBXky1oFPOQAG4QMgNpUpRZ5xk
         +9R+pAg/lwDH9LCfqpKXABMpL8hj9u4GyvQ08z5z0uVtL3BMwd5dfVWU7SxD1cnajJVn
         P2AVPTthpU8IG9vXNEE9er4zvnrhQq6koUa4/Skn4RZJm6Oq5RKm/ADZUyCx4MqoOMBh
         i5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795187186; x=1795791986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Q+A2Pm/lTzn6/74RcxfPC60rEW9xoC4OYcN2wFWBNQ=;
        b=KHwAaTbyC05uyBav8cKWi6CLWgk99BH0KmNkcXZiOT4vE6BW6HCJZ64DkAd2XqTsRF
         LMSfgSTYStiAW552HkKY/J7ercYERuLIE9V7w4r9ZNXs5J/5PkyAJ1zks9+a0mMPN5HA
         h5+K2exkWRiOgh3l41a4qkS2ss2lWHt0HG7sVPzCOMzVr+QIWkyBTcz3UwcpsiNeuiGF
         HtwsO0CSuqBhMIqcdLvs0nlL/OSH0eAfodmApl1KSxHzm8zpY8qWmiTnB8CZ1klOyIJ9
         GB7W+/m4RlzX3ACnUOe5mojYSLfoJrJgduaiDIq4FshYpRSvwIG4hFGhkM8N4yb5KJ0K
         NOeQ==
X-Gm-Message-State: APuU4Z9ztmLv/KCGrZxd82DyTkfxWMh3cdjqVAx1i+t02ZMQvH0VQ9et
	Qg+NehoyS7T1X2XrWLBuPbf5EA6bSKFmJO2dCu7Sz59VyTgSmIgubYGT
X-Gm-Gg: AYBFou0IxwkuVh7P2eTtcFOyNTkXPeDzyetQt8k/VR6s4Q1FwKO314BgFzOiIPrpf0O
	SehS/BT1bHJC6TwYgS3ygjlwvhsy1lhK/TQG9FUsZcjGcNsObHtrJiqLN1YiX0k46i8bdFHrh/+
	Ep/qnIUNZXs3oXt8SKH/C8xLe4DaBUI2Mm3SujMYZTOBz6tE/7OlhBUlpKLIHm2gKt8PtNp24c6
	pLzMRxZ2N9oO+2105sWmzpUj4EgdVJu0hv8UsbnHQlQsH2SYVCM0jEsfae1OrEdl8vAQyg8Mttu
	+thSW8FYTNrFUNmpxJZNrVglabtxsoyvRhukcL4nMMj1RDPq4F06Z2EcDsNyHD7Dhxk7TZ9Ockt
	uClsKn3gx36dPIEE/zSv7Ta5jtSvx0Bu/3E0iIWqW/k4n2s5AMJP26YppBEk43iiFmiDz9yA/DW
	6Uiv79e5py5dIeSj7RFAB86dNy6Z/Kw7Ld+ujJcZueRtvV7Ra8VlVd+uGUaYbXoChw2G5Zo1gEd
	jwm0ryMFbaXO9U8a2L5V2bQtcN+Rg2pNF1NaQqh/hzY1DUHRLZr1zWsaDjUee+3Yj8ueltLV7PY
	9mNW3wP6P6tpZD0Ev9C4glow79gP8TIwPip8JSgcw0NDkxXhAUjJ4AJ63P8EHtk=
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr3023904c88.32.1795187185858;
        Fri, 20 Nov 2026 07:06:25 -0800 (PST)
Received: from IN01-9QQVVV3.CAMNWK.COM ([171.76.82.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm7844902c88.12.2026.11.20.07.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:06:25 -0800 (PST)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	bpf@vger.kernel.org,
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>
Subject: [PATCH iwl-next 0/2] i40e, ice: one RCU grace period per XDP ring teardown
Date: Fri, 20 Nov 2026 15:05:25 +0000
Message-ID: <20261120150527.14649-1-shital.gandhi45@gmail.com>
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

Both i40e and ice wait for an RCU grace period once per XDP Tx ring
when tearing the rings down, so the time spent scales with the number
of queues (i40e) or CPUs (ice). The wait only has to cover in-progress
ndo_xdp_xmit and ndo_xsk_wakeup calls, and one grace period taken
before the loop does that for all rings.

Compile-tested with W=1 (allmodconfig, x86_64); not run on hardware.

Shitalkumar Gandhi (2):
  i40e: wait for one RCU grace period in i40e_down(), not one per queue
  ice: wait for one RCU grace period when destroying XDP rings

 drivers/net/ethernet/intel/i40e/i40e_main.c | 15 +++++++++------
 drivers/net/ethernet/intel/ice/ice_main.c   | 10 +++++++---
 2 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.53.0

