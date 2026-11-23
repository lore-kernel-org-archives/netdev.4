Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423391;
	b=tdOKUqqeS7j7AsgEpJPL9w7M4DqROwFEeG6vLIL4ipAkmox5VNmlmadXKmsOEtnVQIvz
	 aZT74n+rXQTPPkPqgrIPqjocPPg0qx/rPn6KPdJQgHUnfHn7Dw6AVuRiWh3LQp1xgti/I
	 mpZTnzeRI0z47kvg+3z76+tE6uvpDc3vyhOPzucFWVYYDX000MXLUQqXNztrkdJzsMXh1
	 xJN0WRZ65jfAs7vUb27PfNAatQ7mMye1lPVNYV0xheO0pws8pMN4ajs4ULoio87XMcfcM
	 Wcg/1zjvi0vA64M/3E+5tspwOcl1boLQuFP+Z7XvOcUUfspIsUNRYXPtoUp/ejjH0rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7dhioJkfIn8Rp/kl8bWOUoycB6YEQMQ+40u14yq/8cM=;
	b=Hzk6UqTQ4es40Us+ea5XdNscFX1C3WfFY9bz6pBvbltfYi43dB7rz8sCIGVqHtL+aXtq
	 VlG5fTt9OrR8/lmfeRYUBjWCKeTGQul8V7G/lbFDpzd7NmAMH+2R/Ia894o0qObaDu2fG
	 ZFonY2m2mQmOGWIlX8Omy1sFL3kOGzULiVdwEKvmRO15sWkaaMx1HofOZwKSclodhzIh6
	 vkRQ6FaFWXa8QwrkKo87Tc8CKcVNpY+OpSDEP/FtCaEZaBF+Mu1yh/98RLlevPMOXH04R
	 5dIdXeBPJ5hJBswF8vVZzrvgFTx92TmdnTmNPdIVKLbjUR5iTWqA6+zInqUJGRITKfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=MznjcAqB;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC0606A68C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AC0606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=MznjcAqB
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a7b8abe209so2261015f8f.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795423389; x=1796028189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7dhioJkfIn8Rp/kl8bWOUoycB6YEQMQ+40u14yq/8cM=;
        b=MznjcAqBGuBrzDtYHfSXAoUm+3W6oteZDRgJz5YyrNT0xTtbYHFpGPjdoDkEAXMN+/
         gPu9Ln93VX3609Xiz9F+sYL4Pf87TlXCWLkB+AvYzldal2Ipcqj0C0GuXHIxLSN9jdU1
         l1CDFeTEEqzWZLxfO1l0gah291HBJ7rH7QO2PJ1MJTKXkmc7x++cIiyuXtvHWW8mdMdi
         GyuokDyNP/Mvvcd+Ye0SaCnlgeYOwH/yYcobRyUGT8psI/D99uvqgRrrXFZrYwacjWqS
         ktfi7Q2Jxt1S2bNgLPD55Eo8oKo89Te2hVel2XPffYcsXmZSryTQHZNHDcW0ryg4PVnp
         0j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423389; x=1796028189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7dhioJkfIn8Rp/kl8bWOUoycB6YEQMQ+40u14yq/8cM=;
        b=RDHku+HLDvc19P2XJIne7M3VF4KyUAqjMFcZNuPwfoQ4cSGG3vq9JZr9caQkd4IFh+
         dGraFvnH3N/m07TzKUNeSLSQe223xFMgPGOdMpNnYFyr/k6BhI/BWpiij84lZSOc/3JJ
         uoac+9C5ZX9NvqVAIW1Qx5UuZE8kEDTSA7bGhycbcU4FtIuDzXeo0WqoxPyhxSRO2CmY
         QXou+zDZTLlyQ0ly/UuC0VcoxX+GylpGw0QYKZrxxqfYfoIYB15dwwY2eMW6n7dlf4UT
         nYTBeRvy11WEAAO8lLMTE6b9orIwg6s2L9iBFV2NeY57R2C9AtNOdDzFhYylHaAzYIvc
         FR0w==
X-Forwarded-Encrypted: i=1; AL+hErGIAO/xAWEB583T04vF3vSgh13gnY7q0y5Ku0ADu15jGCJZE0a7BQvdRHRydSl1rZ2aNWwshhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ip0s7Y9IMEFqrG9IuIXALyksFYNes+7PY4z4hw/YL7ZmtEbR5
	9hoyE1EJ5f2I8U09ZHjVor3+Myu/tStVFdQ38YVgaCszymi5PRzEXIUhurQxszpPijs=
X-Gm-Gg: AZFdTZcpYUhqu604SLDaDjHJf8Oay76q7gDkNqnbMTfgW/+UZJSdJA4F7xzU7elE/Q4
	wG7938hnIn9WYw0lGRPR7bxjnHjebzjboDm/+yH6BT6zxMxLIv/e0WkDOG6KfJJyxiLRNQNwM26
	jSmYVUMdD/+D3Ib3uwvm2KtLw/NiE/BvORplwTI8/ND7e9l24SlM+sPLgmFi02dJqXgTY/0HiVZ
	3ine6vLy+jR6N+EVDq1PUKDmcAJXP4RKKBg8F69GYGYSOMsPvYjdUc1jAotxMP+q486plLTdDeR
	SY2SIxD3qvUhTX6kKeue9ipnKl1SEktgSCu8STOtA0pA9j1ZM5u8ITB3GNsIHt+WTDvPPXsONJt
	L2Pt1hejamREhgu5RXcu04xsEasS0Q8fWioVAnCl5zVjwMLn0+iElwJJmKvOlPg/tpp/6rmcrm+
	w1duKIve0z8skiAemr4QvRAiiuBmm/q6LJAmWUkPgMxh80wZP2BO+hTJZJuXjJikE9ujLOXHS6P
	Zfo0PIgiJChnJJjGO3eE2uFWPYAKsYz00n+mzifW+hDe+PIuSzTfDUhOZ4dTVOmgMZxnJtumgpC
	1h6/QPAivFoP/NyVpMh3PhFn9WMUP2lGphd5duMfgQZQbA6CkG/MJ9n4Gi1oYfP9uUxe3rMB
X-Received: by 2002:a05:600c:4fc1:b0:4bb:53e4:a7cc with SMTP id 5b1f17b1804b1-4bb88820741mr245747455e9.30.1795423389108;
        Mon, 23 Nov 2026 00:43:09 -0800 (PST)
Received: from localhost (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853c9170sm393185965e9.14.2026.11.23.00.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:43:08 -0800 (PST)
From: Nikolay Aleksandrov <razor@blackwall.org>
To: bpf@vger.kernel.org
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Martin KaFai Lau <kafai@fb.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH bpf 0/2] bpf, net: fix assigned socket mismatches
Date: Mon, 23 Nov 2026 10:41:36 +0200
Message-ID: <20261123084138.723275-1-razor@blackwall.org>
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
Patch 01 fixes various mismatches (protocol, netns etc) that can happen
with assigned sockets which can lead to different corruptions. Patch 02
exercises such mismatches for IPv4 and IPv6. For more information please
check the commit messages. The problem was found during LLM review of
the sk assign egress patch-set.

Cheers,
 Nik

CC: David S. Miller <davem@davemloft.net>
CC: Eric Dumazet <edumazet@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: Kuniyuki Iwashima <kuniyu@google.com>
CC: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
CC: Martin KaFai Lau <kafai@fb.com>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: John Fastabend <john.fastabend@gmail.com>
CC: netdev@vger.kernel.org

Nikolay Aleksandrov (2):
  bpf, net: validate assigned socket on receive
  selftests/bpf: Test assigning a TCP listener to a UDP datagram

 include/net/inet6_hashtables.h                | 33 ++++++++++++-----
 include/net/inet_hashtables.h                 | 34 +++++++++++++-----
 include/net/inet_sock.h                       |  2 ++
 net/ipv4/inet_hashtables.c                    | 13 +++++++
 net/ipv4/udp.c                                |  2 +-
 net/ipv6/udp.c                                |  2 +-
 .../selftests/bpf/prog_tests/sk_assign.c      | 36 +++++++++++++++++++
 .../selftests/bpf/progs/test_sk_assign.c      |  2 +-
 8 files changed, 105 insertions(+), 19 deletions(-)

-- 
2.47.3

