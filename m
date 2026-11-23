Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429723;
	b=Ex6Y4EGblZZbo3LN/tris3SDLTceOvu8agNxeQ2vUqVjOKVuozTbGs22bO3rM8geUxZa
	 NWpnseDhNLOmEdkjI69P0xsZ9+JH6vcx5EBsP0c+90jh2DYsb0Cjq1XVH5BKX31va7DQz
	 wlh2mCbEVrCYA9QOWH8/LPKbvBNMkMuo8eqa9AtqQwmT+/c7KkwY37kBmyAcBxD0CvYeG
	 MXj8VUJ9hkvJIfskVjLOOAfGYLU3zqidz+KAnAQYRIZXSbKnBQ+8OhJ37BXzA87XsGS+B
	 JPxRhXqO7lNBhW3NkMIKSyPe90TcWtWR+fkANiSFIb92G8aAGFrlf7xyUmHtJqdS5OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429723;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=AW+DzSmH4Qpcnnf73oxX0bRUNYCJrzW9mky9pTU2XQU=;
	b=fUBYhO4qm3aUzZ8ppnpLmlWH8jpuFyr5W8WKaSv6hNHtIV6SpPJZHPwJcQiAyHRFxxZa
	 6kRLMx2dNuAl6bb5Q6ZemMHgepBAwySCCIaAG/vZiaI2FNMPJRMxO3fad8aBYZaHGLSSU
	 +xXcaFebLPVmf6Bv6dIVUW4D9BactkuXz9UjmBUTpz3uYmLucS67k31TkPelS1mwXFz4C
	 AkgQd2r1xLVEYwM6+VssMCPS/wn63LiZ2nljv/JiqKDAU2AbrjJPB6Bq88gd3F9ttr70p
	 BAeUlAZwrT9dLWVXWidIt7Hp3aRlPwPB4GvNO95shxmfMtUKOQTytoKMS1606AUTflA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=ZphuaXtn;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CED606A32D
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:28:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8CED606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=ZphuaXtn
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a358881793so1537855f8f.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795429721; x=1796034521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AW+DzSmH4Qpcnnf73oxX0bRUNYCJrzW9mky9pTU2XQU=;
        b=ZphuaXtnpc4u7uh0TNwbpExOsIPvvrSlHhGpm3KbuphdW9KwVTcOQpAWFbkB4ZtrqC
         qDAd04h83WtvnyVVkbXQMpUMAy/aZH/l8S15yvWcrzvFqPrZsbfqN4D0VVjjKW0iiVZS
         MN+yvYlifePhZDo2SHnUvUmv3zTuL4zl+Z36jVihRvzTpyI1N3yBr8Jf0zZMjqFpYwaL
         fUMHC//WJyTDSvnQVwKNCc1NtJoF7unWa8HmsdGEWdnOnbPLZxnUIvL8W3ONAU1yEXl4
         0kntUaITsZt/8d73j1IVrEoCFpCLsOMGRaAS2xAFyQ1CCC/89QG0gNITZthhZZ4svY8j
         6U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429721; x=1796034521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AW+DzSmH4Qpcnnf73oxX0bRUNYCJrzW9mky9pTU2XQU=;
        b=XbfRytyOA23ZkSlJABa1Fkin2u9r8lJTJiHeBUdlWPVj4X8wIEaWLfVg9kClEeSp7X
         wEYQzYo0TvQzsICzMGHlxtn7OeEhjkFaNwleAT+Z6sjUGXY1uMTTvuHK8vNhP67l5UIR
         UGSWXXGdmkWyjclYeQLXamw434WK1eLae1erDDir5MNZgwz0BKFsmP45xEAhxK48AB4v
         lyEASvsp7o3Dv85JTOZp5e+peyoqEN8/5nBfM4lKd/wrfiG7gnb+FPy0mrkdp6fwcweg
         nRC6Tjhnky8vDKlKbj3TWMBXHdEVI+zTBbFVHw1eoiWY7LiJbPeCUP/1bK1lzgByvsxN
         ftfQ==
X-Gm-Message-State: APuU4Z8BkwBvl1Wss4E9Kn5q3BoAvnMqCmstiUXmhvgKSeVzmg6wqrnd
	yxOMxUG8Oyx1NGeka6nj1xgowrkmrFsIFSCkYubyyAwXs+EkXVubuQ6R9U4kEqz+gf2z4fi6NVz
	VDqF8uXf7kQ==
X-Gm-Gg: AZFdTZcW6crlQv6IKHowqG4JibBXd4YqtCmEq06j0YoWVMpMKH4N3S/onti+WJI1qH7
	+K8Wg3rECJsFuQROrB78FFV9TTd5NCh1uR8wQwIVWQ1ToBRH3q/g7bhgE1xEgTyl0Ek+gGYBBQa
	/QdmpZpwdTDHGW0ChEjYdcQcnVVhi+b6+Xi3PoDSbJ6r+JqpyxBw2GCfe+HOZgK0hmJmI1NGSzk
	BkRu/XOJKuZHhO5WBX6VWCY8wibtrlqWFaA/OUQYWLRv7TxDG0l+T91VR89IxoKvqY/ypZu+kKu
	tcvEikEjiF8N8XqCiS5hbZG7sj2DMd/PyOxMGP2tYPlMTkOFhPQnXiieXpoNl/GrAg4EbyMR7Am
	CHBoWSCOvLlksZp1A75CSnmL6KvV70YvE9AbQ2/cm1zdbhddzBVrBxVzgwq39Bw8LAKXHBGpg12
	fE1eNc5NSnkvpo0T9+r1E7PS8dBt/7VfU8P1oSJi0BODXjd69/Nuu75zDeG/fCd9ilJY6ZxBry1
	pPp5jclt2YTB6DALK4GGjPQ04xV+d+ONPqr72tuHaPAPFmKlizAFSCXhAErvpLKsaHnX1J66t4w
	l7rb0tP/8a/IgD7aAHCiDDZgLYuB5NwY5kfFL/4x2RDmOKs8iB7TnMjkSFLjlMbW9rt78nQS
X-Received: by 2002:a05:6000:4024:b0:4a5:2e5b:51c2 with SMTP id ffacd0b85a97d-4abb4f59b72mr21945148f8f.29.1795429720967;
        Mon, 23 Nov 2026 02:28:40 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6a67f204sm24748138f8f.21.2026.11.23.02.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:28:40 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: netdev@vger.kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev
Subject: [PATCH net-next 0/3] net: bridge: optimize vlan multicast forwarding
Date: Mon, 23 Nov 2026 12:28:30 +0200
Message-ID: <20261123102833.924427-1-razor@blackwall.org>
X-Mailer: git-send-email 2.47.3
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
This is the last part of the patch-sets that optimize forwarding by caching
VLANs. It adds the forwarding optimizations to the bridge multicast code
and also optimizes vlan range add (see tables below).

Patch 01 - use the vlan already stored in the in per-VLAN router context
Patch 02 - use a small hash (64 entries) to find the port vlan groups
           without walking all
Patch 03 - cache the port-VLAN destination in mdbs to avoid egress VLAN
           lookups

VLAN Add improvement (patch 02):
Operation  VLANs   Global ms before/after   Change %   Per-VLAN ms before/after   Change %
  ------------------------------------------------------------------------------------------
  add            1      0.0519 /   0.0900      +73.52       0.0481 /   0.0895      +86.16
  add           64      2.2500 /   0.7190      -68.04       2.2726 /   0.7441      -67.26
  add         1024     32.7464 /   5.7028      -82.58      32.9841 /   6.3116      -80.86
  add         4094    149.6750 /  34.3223      -77.07     151.5808 /  35.4586      -76.61

Single vlan add is slower, but vlan group add is 67-80% faster. Vlan del is
pretty much the same.

VLAN forwarding improvement (patch 03):
  VLANs  Listeners  Mpps before  Mpps after  Gain %  Cycles before  Cycles after  Saved %
  ---------------------------------------------------------------------------------------
    8          4     0.785571    0.865156  +10.13         3771.2        3381.2    10.34
    8          8     0.454257    0.511490  +12.60         6900.5        6091.0    11.73
    8         16     0.249896    0.288575  +15.48        13144.0       11362.9    13.55
   64          4     0.765468    0.841916   +9.99         3881.6        3462.1    10.81
   64          8     0.437448    0.501744  +14.70         7153.6        6215.6    13.11
   64         16     0.238901    0.279188  +16.86        13690.2       11674.2    14.73
 4094          4     0.583447    0.695246  +19.16         5271.6        4339.3    17.68
 4094          8     0.293712    0.373710  +27.24        11001.0        8492.8    22.80
 4094         16     0.140026    0.191269  +36.60        23509.6       17213.7    26.78

Medians of 6 runs, 64-byte frames, one group per VLAN, and packet VIDs
chosen at random. Cycles are PMU cycles / input packet on the fwding CPU.

CC: Ido Schimmel <idosch@nvidia.com>
CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: bridge@lists.linux.dev

Thanks,
 Nik

Nikolay Aleksandrov (3):
  net: bridge: avoid VLAN lookups for multicast router forwarding
  net: bridge: mdb: index port groups by VLAN
  net: bridge: mdb: avoid VLAN lookups in listener forwarding

 net/bridge/br_forward.c   | 21 +++++++++++++--------
 net/bridge/br_multicast.c | 31 ++++++++++++++++++++++++++++++-
 net/bridge/br_private.h   | 30 ++++++++++++++++--------------
 net/bridge/br_vlan.c      |  2 ++
 4 files changed, 61 insertions(+), 23 deletions(-)

-- 
2.47.3

