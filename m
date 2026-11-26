Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675160;
	b=TSYGulgUBJAVweo25jnXykzTI9oVL6AVEuKakyd3Q0NzRFvYy8wxh6MuztQb3iN1QBUA
	 IdQHpPPeTKFAAJnnXLOioYBhXGJ318A3q8szM8sfThzTREwV1EjA1KIvS1SvRcnFNLdSZ
	 u8eH18mrFDhaAGeUtoc6zdrhMhSg8pozNegbYJfEKUTxXwXqDVkVJX5duv3cYlIcDZuWx
	 ISAARMXvS+q3tvs9EPxnvwIXKbMuAL/Kx0QGkIEX7lxSllyIdmlUJhVVnBGhpsmfPHAnB
	 9aOx4OJiDPY6ycCnGv2glKOfgrWcd4mdNOcehwx2BY9NEHYJsNtWsFKC21Gf6sY81aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xkmGAxq189flBILjAvyg9STXPHJ6o5FCln03UiNQz+Q=;
	b=KcoR9qYMjxcliMdLpx5dp4JqRWcCaGBpJJz9SoFFS29QBJor+Zh1sViJ6+T168Dj7CgU
	 B/MouOz8pTDsL0pqdM+5bySHppMP6L51LHNSl405adN9m0R1gd+WJefqGWZnMfQI5WX3W
	 i9aqMDDygACssjg7unNFBzD/C3MALW5jKTWY3xu9cWiXyBlY/HtJjo/CC7WBJmz0YYnzQ
	 oItvq14UvqWBis8NHKDe4xQj8aV4FYrqDPxK9HBR9anM1ZdUcC4vbq4pRjM36il7b3K42
	 z2CCfz3wKBLHag+HwKf9LCLlXj+gtEZMiPCdmNOmZTEsU6PzJLRHQn2DhVJtTJGjl3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdiBn3NM;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D626D606A31E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 06:39:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D626D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdiBn3NM
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so2102789eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795675159; x=1796279959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkmGAxq189flBILjAvyg9STXPHJ6o5FCln03UiNQz+Q=;
        b=DdiBn3NMLT/YkBgPZbCm5ZWuutn2bOjhUAFwOK90yCIi1TOzgdz8vtv6Ue53rJWalN
         fxWqk4Pjo3E5ih4nHCycZ+Nj+Fyp9g+Oxki4yEYWkJMMcMRkbTerDrW8tKl2CIW6SWzl
         poaTRNbEOqn7Jvqz6LWmtv5saYnRYF7mSYvqBIOw1BlDqVs4I6jHBny1Hmj4azJTboWP
         nhzg6qKM4oT+e34Inflzen1XG+1T51ZnNqYSYsQhbFU9HKHhicGSC5WPQRtPF88NM0IF
         L7zqOoSaD1TlD1Q0a4V0sHhd8VoxXJIb9Sbzu/utNaKUGyOSTNM4VZDs9S9qE1mkdrbD
         xs3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795675159; x=1796279959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkmGAxq189flBILjAvyg9STXPHJ6o5FCln03UiNQz+Q=;
        b=qnRN+6yuv+94q7Gw1r53cczJaR7KSLbjWrZAkpPt7EzyXoirgO4/OR5GUA51ZjjE0f
         j2e4XuKzk5nAcj0SdhXA5I+qmolnndLuVKzZ+KSb9cgAEVORMwk+/N5UqxHa9C9349xx
         m1CTjVlTVgKFlh18eMtVQBcA2+CuXlXN0HI6+MLgmo1WYfkIUhg//Wphz+St7WaR0s+R
         5d7nJdvWuRJ/fMlpzgtjJc+wFO8UrTNrhXYY3zzQMGDmSO6OYzkaQDnErRSk9wWNqx10
         QGkAoy2JiUssK5ZDzAnJzvIhWPsrpy3DhHKY1JvwcHjZwT4rCfvTaB3LelM/QNi7wMOX
         OQ4g==
X-Forwarded-Encrypted: i=1; AL+hErHFjSnkE7LahPiFXYYI/MKN3u2Flacfm7TimrgfBSctIwxSZVBZa/bHqiVQ5A/7FzfC1Z+Ol08=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vAosQOty9QaDUqNd1MrWslaUf9xzCgDIBoQtg2Wx/wIoLS7K1
	BCLtGU9DN6lGgL7QNe/ECXEe6jo4/JmVaAQraAbXQxPOSRZ35tiFTeS0
X-Gm-Gg: AZFdTZd6s5cIfp+mdz04JFRBC34ZsLBxLWGUCgem6M0B47+c8lLTObwKBOi1zh5YoPc
	+KPnzWs+jJeb+803NZ+ceTuq/2JQ53DdX/Ae1VYxtLz4AzvoOtUuSYjdwdWuRDPfJ+gyNZWVwFF
	X81O12tKnYxtBN50vSMlkMxs59CD7IZy8lLKQUpClqcmNH1XRz0Do6nbLJMrjfEkV/jwp5JugNe
	9iWkQ9dlT5d557/yIaY4GQktGf8d9VCxY0M2tq3saY4QlSfYDiHfLzPv/6QFFW6v2KHFUWhNMaV
	IEVqzJ6+tILrjg5+O7tQ3x7DQIOjZLO7u6l8wtBd2d5YDRSu/HZdcPulLeDbwlPN8HugyIspfdJ
	KpsDOnXHAce9l+v3b4nv71o/YkZEjKKpq+Kk+j/l93JUxh+sj0ynhQY0F3xRAlekY2JG4uZ80+4
	7TnlHpK92hUgo/bJ7ltTrnbyoMZ3ALIRcGz9gqSGprE8gomMdFonpFL/YnMv9KelaWHcCeOhGqe
	G8jO/NZ+0sq8oG5Zts9oJSPxzxRDyf7VvWbXnA86KvOityG7qIojDY0PiWU/cXkpOEpxxHSuEwp
	Zt4+74AeQR2ArqSxH1Zjr1pCTTriB4b+ghEk1GaEhvD0jtHBjdwI+Ig4+wIACNsKOl6GbA1y9yU
	r1UifL+9oLHbuBy67aTcpMKXkTreN+BD19J2Z2apF2PgLqMdE0nnUhuljb+ag2QZdZ5HLddKN6l
	Ece5G9auyaJSCijYvnHNYz5e6AisPhOjq83acd/BfKC6W8X07sFO99Zbs4Za1yBA==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr14457931eec.31.1795675158864;
        Wed, 25 Nov 2026 22:39:18 -0800 (PST)
Received: from LAPTOP-3B99V33A (ec2-3-38-183-164.ap-northeast-2.compute.amazonaws.com. [3.38.183.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm55404015eec.13.2026.11.25.22.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:39:18 -0800 (PST)
From: "Bin Luo (University of Electronic Science and Technology of China)" <luob87709@gmail.com>
To: oe-linux-nfc@lists.linux.dev
Cc: johan@kernel.org,
	david@ixit.cz,
	kuba@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v4 0/2] net/nfc: fix skb ownership and NCI status errors
Date: Thu, 26 Nov 2026 14:39:09 +0800
Message-ID: <20261126063911.353-1-luob87709@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
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

Hi,

This v4 series addresses the review findings on the v3 NFC callback
ownership and NCI status-error patches:

Changes in v4:
- Patch 1 (net/nfc/hci/core.c, net/nfc/nci/hci.c): synchronize fragment
  purging with fragment reassembly by splicing queued rx_hcp_frags onto
  a local sk_buff_head under rx_hcp_frags.lock before walking and
  allocating the reassembled skb, preventing concurrent purges from
  racing with skb_queue_walk().
- Patch 1 (net/nfc/nci/core.c): handle nonzero err in
  nci_nfcc_loopback_cb() by freeing skb and failing the pending NCI
  request instead of reporting NCI_STATUS_OK.
- Patch 1 (net/nfc/nci/core.c, net/nfc/nci/ntf.c): free and clear
  stale ndev->rx_data_reassembly on NCI data-exchange timeouts and
  interface error notifications (serialized on ndev->rx_wq).
- Patch 1 & 2: expand commit messages (including user-visible SO_ERROR
  impact in Patch 2), add Fixes: tags covering loopback and NCI timer
  paths, and place Fixes:/Cc:/Signed-off-by: in a single trailer block.

Validation:
- Both patches apply cleanly with git am on v7.4-rc1 (6628e7d4c6b2) and
  pass full-tree scripts/checkpatch.pl --strict with 0 errors, 0 warnings,
  and 0 checks.
- Full x86_64 KASAN + kmemleak bzImage build passed with all modified NFC
  drivers built in (NFC, Digital, NCI, HCI/SHDLC, NFC-SIM, virtual NCI,
  PN533, PN544, Microread, ST21NFCA), and W=1 compilation of all 13
  modified NFC object files produced 0 warnings and 0 errors.
- Real QEMU TCG verification ran 32 NCI 1.0 MIFARE status-error (0x01)
  exchanges as euid 65534: unfixed baseline returned SO_ERROR=-240 with
  47 kmemleak unreferenced objects; v4 returned SO_ERROR=16 on all 32
  iterations with SELFTEST_STATUS=0 and 0 kmemleak / KASAN reports.
- Real PN533/PN544/Microread/ST21NFCA hardware was not exercised.

Best regards,
Bin Luo

Bin Luo (University of Electronic Science and Technology of China) (2):
  net/nfc: fix skb ownership on data exchange errors
  nfc: preserve NCI data status error codes

 drivers/nfc/microread/microread.c |  3 +--
 drivers/nfc/pn533/pn533.c         |  1 +
 drivers/nfc/pn544/pn544.c         |  3 +--
 drivers/nfc/st21nfca/core.c       |  3 +--
 drivers/nfc/st21nfca/dep.c        | 26 ++++++++++++-------------
 include/net/nfc/nfc.h             |  5 ++++-
 net/nfc/digital_dep.c             | 32 ++++++++++++++-----------------
 net/nfc/hci/core.c                | 27 +++++++++++++++++---------
 net/nfc/llcp_core.c               |  4 +++-
 net/nfc/nci/core.c                | 18 +++++++++++++++---
 net/nfc/nci/data.c                |  8 ++++----
 net/nfc/nci/hci.c                 | 25 ++++++++++++++++--------
 net/nfc/nci/ntf.c                 |  5 ++++-
 net/nfc/rawsock.c                 |  5 ++++-
 14 files changed, 102 insertions(+), 63 deletions(-)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
