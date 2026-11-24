Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539958;
	b=M0OwZ214Ly6gVAMObne8xUR+ELd5qEd6LU0DAAiQCO1aJ9xwD/t0+cN/1jUCjr7sjIFe
	 asEs0woA5OgfuGG5Y+OXo7t0FLxg7VA3JKNBvI6g+f2cysIJHbTm6/js+HVzE4NnwoKom
	 m8Ffc94X/EKYop5cM2bzVBxB85vrCVM4c6M0xBW2k35+WbuUcSXD/n03135eMfqgM0uBC
	 c2vELr7rkCTuzPHLBI3Rdjpis1p1MZprzK1ZB0gKRHXvdObzvfoEAYpxz2D1nf7oQabPh
	 oxRFBOQ71s4vju+Qp0Z6kUWT3DwEyNSNpH00We5k5PdegZVu5gZF7SnEC0Mu5EoecFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pP6aei8nqMk63mvx6QqGhhPbY7vTN/MZxXmF9vJE/J4=;
	b=CPwSb+NJdcXRwUHQk7F5pMioQn1q58AM5fYrj5Xiqn0YwhFE93Eaygc+UjoELw7obOfY
	 ydSwj7g8BRfDOM2xHlTczG7rjH4X47rxU+gfHugaU7HVvmrmGPQnGSH57d17bUQ3sP4Xy
	 LkYMZoxT8MO77C325bnQYjMImeZZ8dSEMfDOpOnJK5VNp/0i+bEC1Ysvvn/COf+iu4dUA
	 Mp8I5CcIb4NOZNuLe0ZuaSVLVoxT7aMbFau19yuYQtGamn9iILak4XDfaATDV3nT/+29J
	 7HVClMxNPalZft/xe9dHE+KA2aTayLtof6DHjZtip3nJTX9dYX4mNSy/1bOJSypL/7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvGCWv1U;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5A3606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 17:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB5A3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tvGCWv1U
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91ebf4cd218so39510376d6.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 09:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795539957; x=1796144757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pP6aei8nqMk63mvx6QqGhhPbY7vTN/MZxXmF9vJE/J4=;
        b=tvGCWv1U5wBBO/dy8gFun7VIptemIWgx60Jj6T3BHOosPXbLz6+izjDNNJZl2TpyGD
         Jy4V78AottrOMXvUUkybVZLMitRuCnrquMagoGc3mb79Ksn7+jtXbQEEHbmGVyM8ZFKZ
         1013LicX1tTGmhU2bGyohQpdeu+wBb3Wpv7YPLa1lsNXC9fUtbzvZTx+F5TwhJhUSOBk
         KVz05TcUowGsZKT/8a1gwdBpPkIaWfX7tGGRjmtFX6cU/WOYhluDCfi/dDiP1kRlYlpT
         Qjbxvu/k9deC76vRXwwPBVM/0L4uMiL/DbsCLjhfYIn41oWC5TyCFk9CyUldfQoIYtMF
         XmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795539957; x=1796144757;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pP6aei8nqMk63mvx6QqGhhPbY7vTN/MZxXmF9vJE/J4=;
        b=Blj0Qf53eB6gCyBE185irOZ47lMrFywBCY0Mh9hwWzy2BeZY0rONbR7IXqCbX+huV2
         39Cd48WklZEONTgmLBJ9Gb13afKJvxgCEx4hpkYE+9zISObgpi8F70/FKbsQv8KcZGxv
         2eSUSY3wysp1vJoNprFhTVDyN3EzLtYhotZzPzFyZWkG+G92PKZeV6YqRjZzmWdMcAKd
         QscWmD25oyXz5mbDcAD+d1HRSdvuMRvRLkUIIU/UNIMPgN38O/SUuanFa8A1Zakk8jCB
         i5MX3UXiUqTV/HPkUo/GT0x+RL6JDKwetB8SSyk64JXCnUeZd2uxikHmsDpwY4vl7Qtf
         OWZQ==
X-Gm-Message-State: APuU4Z+lSEx4R4o4P4z/FDNaS8ofSiSTTMkk+pWL9pcPmQxKARyTixxE
	5+qkVQNL3ARMijvXAPraH1HnCLL3PIstcyqNK8CxT2fpIALp1bDem5+nqa/Q1A==
X-Gm-Gg: AZFdTZfe4ojwF2imuns/Gctmj0gSO1DGY+JR3qwq8j2qmrQDDYjBJbkIepgjDkrsJfs
	lPWmYtRnZGUIDI8AWa7xuK7Jc2ggTj+Wb70q+cI6STlm3977noEOt+emm0qwRtKGULwsXbDhvQl
	8xGjGhVYYAyTamJ4IGEW0gzD8E7HiB9g+5oTAbimG5SbKrg7+WjZQys052IDAStIvHv4I/WUm0P
	n3W9l0veVHrIWZXH3p6wwPOwM8mWr7iYDM4geOAnlJ4oQ9TTZhLtn9QFdvuggVEFiCIiccN9a8E
	D8I5xSpO2MqSWxCwoc2E/B3zEiRs72uf9+CpSVeV3oy6G0NG9o7EzPNE5/G66Pz4GsWgY/bjkQC
	/i8kX14APiIdKBu2XWfp5cxOz9PS6SRSAAmrrswcu/C3tr342wtbrOpZByMNK77i7rs+LMKTg0+
	Mf14QtFjQn3Nz4ktOp6hjvXVviVeSm2ZXBTko6dA8cmmdNSIHl3xiTpKJphNI89h83QjRbuYBkO
	aha+pu3vFX65a4xbInax9tfHTJ7b4J+9k4QwdYZl1cxu/qf/ELgiSJzdUHZFR3AzOLu1E4hZeuH
	C5YoodIkPnwIwwPfLrYXgccC5uUg7gfa6J06yb2CUcjRV4NVrCT67S9RQfWhQIHfRYuyxDvJjwe
	VoWhrNbybVhYzmxOO34jIfWa0euvD1DC8d4kRrVfK1wxgOAVTGY86DZ1TkSpFd1GJkr4UbAAfFd
	3FQQHxtpgEOA==
X-Received: by 2002:a05:6214:4847:b0:91e:a1e1:697 with SMTP id 6a1803df08f44-92134b1828emr240407936d6.45.1795539956508;
        Tue, 24 Nov 2026 09:05:56 -0800 (PST)
Received: from willemb.c.googlers.com.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm140078216d6.17.2026.11.24.09.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:05:56 -0800 (PST)
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	elder@kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next 0/6] net: remove dev_validate_header() and net_device::min_header_len
Date: Tue, 24 Nov 2026 12:05:38 -0500
Message-ID: <20261124170551.1874487-1-willemdebruijn.kernel@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
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

From: Willem de Bruijn <willemb@google.com>

Remove unused link-layer header validation plumbing, clean up the
remaining af_packet users, and drop net_device::min_header_len.

Mostly cleanup, with two user-visible changes:

- Patch 4: on devices that set hard_header_len but have no link layer
  header (e.g., PPP), SOCK_RAW and TX_RING sends now always have
  skb->network_header at the start of the packet, not only for short
  packets.
- Patch 5: on SOCK_DGRAM, the VLAN TCI of non-offloaded tags is now
  reported on all Ethernet devices, including those with
  hard_header_len > ETH_HLEN, and is 0 on non-Ethernet devices.

1. Drop stale Ethernet fields (including min_header_len) in IPA modem.
2. Remove header_ops->validate and dev_validate_header().
3. Move af_packet TX header length checks ahead of skb allocation.
4. Reset network header on all headerless devices via dev_has_header().
5. Use ARPHRD_ETHER / ARPHRD_LOOPBACK and ETH_HLEN in vlan_get_tci().
6. Remove unused net_device::min_header_len.

Testing (under vng):
- tools/testing/selftests/net: psock_snd.sh, psock_tpacket, and
  txring_overwrite.
- Custom tests for short/zero header validation (SOCK_RAW, SOCK_DGRAM,
  SOCK_PACKET, TX_RING), non-offloaded outgoing VLAN TCI capture
  (AUXDATA, TPACKET_V2, TPACKET_V3), and 48B/100B IPv6 TX over sit
  (SOCK_RAW, SOCK_PACKET, TX_RING).

Willem de Bruijn (6):
  net: ipa: remove ethernet-specific artifacts from modem netdev setup
  net: remove header_ops->validate and dev_validate_header()
  packet: validate TX header length before skb allocation
  packet: reset network header on all headerless devices
  packet: use Ethernet header length in vlan_get_tci()
  net: remove unused net_device::min_header_len

 .../networking/net_cachelines/net_device.rst  |  1 -
 drivers/net/ipa/ipa_modem.c                   |  4 -
 drivers/net/loopback.c                        |  1 -
 include/linux/netdevice.h                     | 18 -----
 net/ethernet/eth.c                            |  1 -
 net/packet/af_packet.c                        | 80 ++++++++-----------
 6 files changed, 32 insertions(+), 73 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog

