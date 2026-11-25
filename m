Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617924;
	b=DUpdtG63ot1CrFTgz/rAymEWkdMAZppzzY2BjSJplw2D6QWDuFnxxV4V4PaNIRX73xfZ
	 ElnWjOxScCeZcB7wIoW3lEsPd6n2TzTWsgs6BwkZ0Z2DaNM7VnnNTFwJmxxj2OBbR11ad
	 6Fm2AOM6lc8cTGA3q1pWuIkvDyWztk+d1LjiRNPobZYbR7M305WU0fVVihFToHk2yf/Ul
	 2U6HElp3Dv6v0JB7p4E8N6Apa6ImK4ZYS8iuwLLW/jrpYUKmhzx2kJ/oQPhjXyl3ZnsGn
	 Ja1Lw27tCbgP6Q8Jh+7QuztuDDin92l1p59J6/8DBX7r+FXQ/ydlJcJBeEvmO/YKagA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TZZGnQrheCo8IwMaTwJvzugJ+PAdxbUJ+yLbatzIT1U=;
	b=N4NmPbl0BVHueIQbmpme8WbxbsIGMVwJp657hwN6HQer2qTdejJeQF/23HEmQxjzlUO8
	 LOQK06M/NI/vpvlrZqZlzrpv5TNwG7iWY1H9YV9au/GqlhqbovZ633ttmmtxwImWfMtWM
	 AsjvqOjp3FZDk3M0fSY7ulMyz1V/h5DKGxUq97H+PTs6SitFA92AAexFdIV7Do2jQYW95
	 sBBd8w/cUvTNTkIitwYVPFS+uWhSES3MC3S2v6gtsUSOi3XIhS2fLQEWGAc5es1c2zwMZ
	 xKNEgz5KgjTLOPfTLDUSquyQCqXlnQO4VAy++e0FB8y2IzMPVUCEacKBAjheX9TgiGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMmwuHsQ;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A96E606A338
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A96E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMmwuHsQ
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38644aedba1so8886997eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617923; x=1796222723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZZGnQrheCo8IwMaTwJvzugJ+PAdxbUJ+yLbatzIT1U=;
        b=mMmwuHsQTz9kmNflAogL29vlIOmuNtu8dbedOUK2++NCoCfHO/vByKQkLx8ikeA9go
         fnH8zjdx9zlapJlv2iSns8wdZx1jqOIejPtOPia0Kptnj2nBI2D3wuVLZPj0pnbgQpYH
         vZFb9H+Fo2BfMY7kPYh3bDridF5wqwVs+8wccnHIabthKG1dDR01qm4MJGt9IaDBiDOH
         POE7EuO6lGXK5NgGPYbxjOG/fuQaGP6vpNPjBX4bFm8JkBXfWRnEtzEIlV8yQ6kfT+tH
         N8/xtSsAZnJIhUK2AvaOKbWEbozf80IwTrF7//wr4wYPLVG2kn7p8XqVyO/0ueqdL+75
         oeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617923; x=1796222723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZZGnQrheCo8IwMaTwJvzugJ+PAdxbUJ+yLbatzIT1U=;
        b=wdaNDDUdmHzW+e+B4Cz0Kufl97mTe3gq+LaiOU/B+D7QgI19FfGUKwQPmXdahNJM4l
         wnnOFnH/dqu0NtAMEWjF1bKBdXxdGFHn95jG4SlNAqqB+cPdbnLDG8fNOI5v4+iJpzPf
         dqL92J/T4+1y53cfme4ZtkXvu75tG7Udboj2r6xPczQHdWQfhCv1qRygsLWsFii0H02e
         +tMlfI/SxNTmYPmeRDDLgxLPlVh/vQlsPvAUJvnEjXwb+cPIMoqcEopI8E6CCDq5dMWO
         uyo6rmQz8AbDtnWqvLoJ46i3wwqtc6jZqGvwUah8Gh37is//lNr18ibYUWx9VKYxY5cM
         3uIg==
X-Gm-Message-State: APuU4Z+eV/gikERZ7bmJioRYLQJFJQpiIQkOzGBLmnfdqJwYnLsdr8oj
	mxcI6FxqhaoGJg8FVYu/mKvHPlMCwDo5NRyhKqJnl69xIf4QLQOI9pkkKojWGA==
X-Gm-Gg: AZFdTZcJJ/i/gBGcbBaQPrGajtXUQibR5wSXf7mf7RHzBpsIBnRQ45K0xDWay2yGGPB
	7IkHfSNZgUX0cjR7O+F+tBrodJoWJoQKp83Hze5dxTtzpagqewOEGtSPSWnY3+cwVtfNuE5ibKn
	ABw0yi9nEFt/79ZjuIcJ2MVQL7MRt7/F2i7gEozrneSRFvy54+owckFjQgTK1s/Igdn1JN/RbfY
	7s6BDTdtsjVdGrAIwsfkfEqTAHgNOJa6ve4ePCVNIqYj0lFznmkVxsKsDIbvnQ834rSmweoMtRr
	93EiXNf628DmJ6ToG9aT71tsTb/lRgd2TxItaVxUqKmGUwQqYRWo8orS2Y4oFxICwFWK2x+FY3+
	YAL8R/jwH40W9xrasOek6zQIKCbZ3a3oSxwXQ/78l9q9J4oBM4CEwlE5sFwadq/XY+fh03BYhTS
	6i2wQWupaCNcJwH8mQcHPJUDiC9hSRbXWm4geoRIcp7ccE1KmgwnwP7S0bn6/JV8ABsEEkuLxpP
	5fD02Keo7yeZmoukBVJYyCStINBaDM4ySggrMppa+STus4aBpYyxvr77k7jy/GE5ACeyEDm5eJ9
	ZgA+A2IZefz2kq/oqjx8F/oMQWU5azEXZ26JZxDzHjRWQTGaMxNGj8HYdEemW1swd2ZYaXaylAY
	hqnCBVC6/3xc0d/CuTWticvtZrOHlIubUPf2LajsAVhyhPumJITafR/9AOs86Zg3FTM1HGNLc4Q
	==
X-Received: by 2002:a05:693c:88d4:20b0:386:a8de:2bfc with SMTP id 5a478bee46e88-386a8de2f67mr11085085eec.6.1795617922809;
        Wed, 25 Nov 2026 06:45:22 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm57121181eec.28.2026.11.25.06.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:45:22 -0800 (PST)
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
Subject: [PATCH net v9 0/2] genetlink: Reject joining multicast groups no family owns
Date: Wed, 25 Nov 2026 14:45:12 +0000
Message-Id: <20261125144514.2717012-1-anilkaushikwireless@gmail.com>
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

v9:
- In the selftest, find the initial network namespace with its fixed
  nsfs inode number, not by comparing with PID 1, which is in the same
  namespace as the test in a container (Sashiko).
- Unload drop_monitor at the end of the selftest, so that the next run
  does not skip that check (Sashiko).
- Patch 1 is unchanged. The Sashiko point on it in v8, a family
  unregistered during the join, is the window the commit message
  describes. The fix for it was patch 2 of v5, which was not accepted.

v8: https://lore.kernel.org/netdev/20261123155503.2497063-1-anilkaushikwireless@gmail.com/
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
 tools/testing/selftests/net/nl_genl_mcast.py | 128 +++++++++++++++++++
 6 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 7b0c5f0c757cb61e28dc4128633877aaa8f6f9bd
-- 
2.25.1

