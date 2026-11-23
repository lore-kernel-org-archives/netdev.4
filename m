Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449312;
	b=C/jmAjeQlmIiZGwmIfPdvwupfjmBN7+Y3bNNUgSLZbhUUBer+PqDfMXVlwKG1P4XpqN8
	 HF6PYikBGQ1pgwvyoN1StfHGpvk75jJAIcCxe/JtcsBIoprlbm5AAZV5tOCHPdKRzzm1/
	 0WPM4438y/SNeWrsD6CDfPhRqVDFYvo3E+mzb0MyeH8+/A4ImYXayzizsddHah1lrLcJL
	 qTN/XQg3sjShPY7hWwwid8Wg++zdt69mq64SGEoopX9cmXo+LCOsDrxdSKtG9ieUGoQJD
	 RrsM8IzLs4RTUZOPWaCDSeMUrz4alwghBkzATETNQndcmzKjLQtU+QFFGl6vex5XSmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=78yadV2O15NP1wJTol26zAS/3koPAeUhNSVSGjvnLZI=;
	b=EqD8CTcv9mGeerMi6SlUKjdReQ0Ux3CxUljqpV+PgWQPPpXKAV4lt94+RaT+yaWYSqHR
	 L+lrOODcMMNN4ZLgSrz/ql8lPk0bsgRQTfud9jU/c5hZRQ2CBo9t+MXqTzNHIkxVbwM9Z
	 dBUkIZWo5ELbu506VWbAz4om7Gf2Zd0Z9T4LDK2qyFWGm4FPNXBkMMuZZS7lIo4oXY0EI
	 7iJfyrgZwadFdF3ZhqWzixPWdFrLgvbWRL4TaDlWT58AjNRUsfbTJSiCu3+euV5SxSmT+
	 HJr7mFSglGGjMJ3YmeksAMtacq8PeIuKQIgVxB3s2Tcd7qRQUIMf+E6vtMNVsFq1KzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oyi0sjgN;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FB4606A332
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70FB4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oyi0sjgN
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38564b4b017so3695469eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449312; x=1796054112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=78yadV2O15NP1wJTol26zAS/3koPAeUhNSVSGjvnLZI=;
        b=Oyi0sjgNBfHQvcu4yp0AJdAbkH6qJCsirLuyq5oQ+mEhfMcUdDF68DxUROhirp6zV8
         j7uQD+oYr8i/JjJul5XMI/HkCbjO5U6Dqub3rIxbrMNSX0+Ski8HfZZNOzlV8MQmUv3D
         tgW0hAf23nFZJSVY0rf01lI8GOPOlEFyn8KItGbiKuHaC7ZAuZxjiNN6UxAmevEI5svG
         QBFhRNrqTiXqp1tE5P2wV316RTKWp9aWjmwqJcD4DoC7ibSgNuLyFA+7ekM2JAJ7ICl4
         KnrUKKn19xTuSHAgWEzO9b4DFrx8k8943tEGikmv9Xw2BD5He7BbILG27+Ln8WngMac2
         m8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449312; x=1796054112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78yadV2O15NP1wJTol26zAS/3koPAeUhNSVSGjvnLZI=;
        b=WIO+bv8z8lu9IM12Zmf9L38+gh4SPGcgLIjbOmQ3vonkQj1rhdNOKCUoxOzdVx0Rcl
         x5DYAODkwPKDmKWjF+dLtlMos35wuH1/T53Zi51yf5Emdnxv3sWTJF9VMPyMB+HndHo8
         CvIHXvQMIR1kxLqm8GxlzhpjRKOZu9VEIg4AUU0yEe+gXZmk+W9q/ssUAtgTDhn6Yq9x
         ej3n/Mar8Np+p9DjLJW2cP40ErYu9w7Cbnh05eGC2z07VOLaGrEKS9BPMM6G/wZlt8bL
         u7VxeWXQcKB/87TuhXvX2OXE+npMUYs87lEvtEzlPhKRKRkPMk4Q6HZ9Z0gA0cUTAcFE
         gtPw==
X-Gm-Message-State: APuU4Z8jqT6ujLi9G+94M871Jdf4S1uXv2+rji+FHl2OPAB56z9fFQYk
	XgkRHt0H/62FWUxnjfrZtu3cxttZLoQ9HKkKBxfbMtJ6t8Lq4GvFcvmAkhLunw==
X-Gm-Gg: AZFdTZeNI/d57vOiRldKQZvL/YcS78qKuj5ShdR/A1ZNFUVyzUd8bQO3XpdV8+OQICf
	v1/kiIfMfMXn399C8Mq30ICY4OsLNnYtQ9mA1CKRqoCsxGvt/eFDQ+vLgKGtMoCRKv3nOa3vuby
	QFLLs08nJl8qhEUXjSLd/xFYUF4DwHVmVjeRlOhU96EEoKGHGOnbSoWX+jueoX898qDO78gBy1D
	p8MmOFEAkHEu4JOCmKONVeBDf4qMwz1LIPSFgEo0WgQqYcynfTVi6DrFSNfwozAYBOo3LPDe/mc
	TJEvxJQ43pfOuUtFQNYRsQoo3CorrFjI8XvTCA2I7UV942LhbaMi7508IuguT2UGFziXPQc118T
	inqvek+Udrvkg89Jl3aeYY6fHe4TrJTQbT1+xpz1BSkwXFWN+/GPaUBOIGd5jvSOTTvau879QBJ
	Hv3bnxAILlIsIq2F8zLoCffKbNaZeEsBNbBFGJhIT8iEHaeh5pkVUL5C+kcpNStnLUKq0wVH2IL
	V23TRkPpNwqMbmwLe4E+YRLL9tl8TeZhtbqorePN4FIsvgl/mz/i/9qSv4Pbs2+FSzvccHqIBM9
	6/gahBcnH4/cI25qleMpsVOEwkQdAETCAuYzUyGQzNW2SK609La0SKe+rKppe/T75glofIJzV9o
	83OwTPubw5n0wcrFZRO3L+CG+zwPrQ1GmgG9+5JlUugj1zA4ThIFdcXxkz3LZd08HmoDzjrCU5A
	==
X-Received: by 2002:a05:7300:d112:b0:385:7045:1736 with SMTP id 5a478bee46e88-38570451c98mr11669850eec.19.1795449311155;
        Mon, 23 Nov 2026 07:55:11 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm13723517eec.18.2026.11.23.07.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:55:10 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v8 0/2] genetlink: Reject joining multicast groups no family owns
Date: Mon, 23 Nov 2026 15:55:01 +0000
Message-Id: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
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

genl_bind() lets any user join a multicast group ID that no family owns.
A family registered later can get that ID, and the socket stays a member
without a capability check. Patch 1 makes genl_bind() return -ENOENT for
such an ID. Patch 2 adds a selftest for it.

v8:
- In the selftest, read the group memberships in host byte order, so it
  also works on big-endian (Sashiko).
- Skip the selftest outside the initial network namespace: the family
  dump there does not list the families that are not netnsok, so it
  could take one of their groups as free (Sashiko).
- Close the selftest sockets, also when a check is skipped (Sashiko).
- Skip the drop_monitor check when NET_DM gets no group ID that was
  free, so it cannot pass without testing anything (Sashiko).
- Rebase on net.

v7: https://lore.kernel.org/netdev/20261116124030.1595567-1-anilkaushikwireless@gmail.com/
- Add a selftest as patch 2, as Nicolas asked.
- Say in the comments on the static IDs, and on NET_DM_GRP_ALERT, that
  they can be joined only after the family is registered (Sashiko).
- Say in the commit message that the unregister window was already
  there for the capability check.

v6: https://lore.kernel.org/netdev/20261112094205.1120090-1-anilkaushikwireless@gmail.com/

I used an LLM to help write and review the code, the tests and the
commit messages of this series. I checked and tested every change
myself.

Anil Kaushik (2):
  genetlink: Reject joining multicast groups no family owns
  selftests: net: test joining genetlink groups no family owns

 include/linux/netlink.h                      |   3 +
 include/uapi/linux/net_dropmon.h             |   2 +
 net/netlink/af_netlink.c                     |   6 +
 net/netlink/genetlink.c                      |   5 +-
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 127 +++++++++++++++++++
 6 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 7b0c5f0c757cb61e28dc4128633877aaa8f6f9bd
-- 
2.25.1

