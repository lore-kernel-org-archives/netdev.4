Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196625;
	b=FruoJKzQP5R6iz+Hg2PAbIBNh5+3A9MCH+uybbscukdVMtoNgDXV9phLT/f0dolYl6DP
	 Q+/wn26vAa05vH/mqWfxLk5TG6oBHFocmU5hVJVoKQNftqnZEmpwl/k1wPp9fPHRVxrdv
	 sEi181WQZmkZz8OvdTWnRG2Se12dr7xPQEa3QWnbjV4DL8Vpwg3xjqfAf8MVocRe/WwGR
	 9dxwLXMon2DOF8gKnFOZkozPhcLKNHg4hr0peTFdMdcGV2QIqBgRTiSYr1wTQEq9u04j4
	 YzNYTlpy92cyjPuzc6dqYLnPPqWUx7CRhmT8/vEdlyzT4v98qIAR1toAo1so6c01CAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5z1EgR65emUydSCqho9zKh6KfG5YB5vPm248oYuEGq0=;
	b=S+GA/hSxUpc+5nm9VMmW0meEHPj9+ibb9305DtXWc+VK/Dwd4ZfEN8QWcoMMDUiOK0Fm
	 5TgKXC7zdmq5GkABDW0cAku93YSYsD8jzehRWLWQ1CAz+vleQACnFCLhF3OACqOwD/eTY
	 jokfe6acKnxzIxY0aQpMRZOj0+1O1SmeplTmdwsCsiEqKBSMRNGwy9RSUWe2cvtUqrSsB
	 dvn0tgl9IGR/QxGzMW+c0PvgqXYHxupceafrXQZlbtRar81bfo+XijUfkNgD7VquXunNp
	 GtQCee7GCK6feLgbrh1An4du/+Hc6/wIy/czKdv7QU2xSqNhlolAwi7Awm0/yjGhMoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="znst8q/z";
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA7C606A7C6
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA7C606A7C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znst8q/z
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-745497ac8fcso465926137.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196624; x=1795801424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5z1EgR65emUydSCqho9zKh6KfG5YB5vPm248oYuEGq0=;
        b=znst8q/zgI1dTcSh+97WdgRu1/7fSZ/YVcxApvB9sqUs7XECM7vkrHOqnlyTsAkq4m
         Keo2PN2Fle/zyfoibUcwc/l3XWkZFvnbQN9Riw2C+YFt8webA6Ld7xML3JuFTVmKaz9K
         0tLV+w0Z5Cd4lD0CWM8pIZepoDQEuFQrTZrYy7lRgzsaFboJiL9ieGwleMa01Au81/yR
         sJnXpsssLc6Cun8Aj7JFPkxio/r6ebHLYTLvyXy+3LSRNou1x8M4nVl2vA9Xpa3Q61M9
         vE7cicjhqH02ympWsnYRYQn6gk1P7buW0QYksCRuPOCf0vkn3lXeN3EPjoxdyXW/Xiii
         kpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196624; x=1795801424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5z1EgR65emUydSCqho9zKh6KfG5YB5vPm248oYuEGq0=;
        b=U7LNx9Xq3L+G+5jGjYY1h7VBoIzLsg6Ymle9Fu6z3KmYxy3zsFfMhZYweUDcOEJ5BS
         nLo2AOzy29j0b2/2bT6gJQyAWcKg4RnPeogWoMImaLPDG9IPIahtc6GoyWNMilSeQaps
         Mc8jUqTbBIf9E0pYdcznKqZpX4PUJKIWJt5iIqZIHy5VEJ/FpwbfgPHpfh+JHxXYInUI
         XA2M0+1qlt7OsFJn4laH0u/lPu7JklczTGNC2wdYIXjTDtwq/ir8lu0LZEWCUbGmwOG9
         yrStoErzHHhuFb/nPkmETrbC4tskkUTgM9CcOb3ncUwAqYWSVFuMqV/aOhXU1GCruyzh
         rf/A==
X-Forwarded-Encrypted: i=1; AL+hErEhqr15yXk7smV5vmUQoLn2i0qvAF9BFGbcw3KX68yIa8c3aaLIO8UCNLPH6MWJSf6SIkgGazk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aHygmbyow3Xb1k6PJIDVh1Saa6VC2MK9MAvCOhEDkqJ/o7Pv4
	C6nSSWqxa3Me3y95nPP3tdQdoEgI5O6+d0oaHhZjaufaOk1u9BJLDREl
X-Gm-Gg: AZFdTZdi7CjnzfDVIIqoBbI2bI1r0bnZy+Nf+TDwElj+Uo6tI81L6aC27snAUxWyABG
	oTwgJzOdbzsCz61W445HCeLQnRIkED7Rpu4QnbrgKoY0FBpkWJR4H6+V/GxZ57P1k4Gtx3kmmEJ
	wgGlr7JT7Qqxcm4OUy3tAqu94LfI92WzxG0oR28oE+lZQ4FFfe6sGAFwPNJqoqAslM/ZJ7/fdCv
	UsVrgI3iDAEhn8u8YTwleKNksH8eotAzYi9Cqe5dPis/oxWxR/FXRq7ni/tSI7TM2OI6Q4IjhLH
	tfliAp4Oz71rYxI5MMeZ3dowy9b1udhcFezpEboqI1X0dWX5b8HMN4RJlRqaW8zJxZPL+xvgRol
	l2wwcIKLHRuIJQtt/QvaC6jblpBLU8CSZUoClISAOpsJ3hksPSQ8AfFlOXWXo69XGHYCJqQ/96f
	du9++49UjSX8Pm5Eey2WHkwM4tBkZIL90Epd0myPegBgGcl4kxbz4h9MdVxoPEVUSgxFRhSaadk
	zYjBSL5aMXbbvm2eK6+OCQO8l/TeGg3M2YBmS6qPdfDJkmbBYx5cT60CgsAX/eiMblX0PHMcI/A
	8r9f2EOMtiFAflHZZIdU01pAuJhQlJZDVr8WhKYy+RD1GVOFcq+P/kXUMATFH2x7QbKCOQ==
X-Received: by 2002:a05:6102:3f13:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d72b368b75mr1845474137.5.1795196622985;
        Fri, 20 Nov 2026 09:43:42 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3571363137.2.2026.11.20.09.43.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:43:42 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Eric Garver <e@erig.me>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/4] udp: Fix bind conflict check bypasses
Date: Fri, 20 Nov 2026 12:43:37 -0500
Message-ID: <20261120174341.35873-1-juanagusnicco@gmail.com>
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

An unprivileged user can get a UDP socket bound to an address and port
that another user's socket holds, in a state bind() would have refused,
and receive that socket's datagrams. This series fixes three bugs that
allow that and adds a selftest.

These are sibling vulnerabilities of the TCP one fixed by my
commit f675070191f2 ("tcp: Fix the SO_REUSEPORT bind cache admitting a
conflicting socket"). The one in patch 1 has the same kind of cause: a
SO_REUSEPORT shortcut that lets one matching socket stand for every
socket on the port. The other two predate git. All were discovered
during an LLM-based audit.

Juan Agustin Niccolini (4):
  udp: Fix bind conflict check stopping at the first reuseport socket
  udp: Keep the bound device on disconnect unless connect() set it
  udp: Ignore a connect()-set device in the bind conflict check
  selftests: net: Add UDP bind conflict tests

 include/net/sock.h                            |   4 +
 net/core/sock.c                               |   3 +
 net/ipv4/udp.c                                |  69 +++++-
 net/ipv6/datagram.c                           |  25 +-
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/udp_bind_conflict.c | 228 ++++++++++++++++++
 7 files changed, 317 insertions(+), 14 deletions(-)


base-commit: 19a227903e65c7a9c179156485660a4e017575fe
-- 
2.43.0

