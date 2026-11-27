Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749776;
	b=N/uquXKIezs4eCXfUUgpSh25Bl2THn2oMzOWivpknUU9RkOoKQSksu8HS4Z0pB6ZtqdF
	 oxJa9Zntpf5E52Lj2YaI2bhP9Mai8p+5D64/YLL9z9dt4YuU0gjaaRG350407mstGIhK7
	 JXtjFWlKSp10FQLqA8XAx/eAIK6n1MYkOdNOypXVtCrQuSlZHRBbDNiHR5Vqm5ubTzquo
	 QnLJAEYDDsT+tMDfKVmZjhFk1xauD24jfddml2LZeELlE2cqeZYPpsPZC7DdTBqN4Di20
	 w5v4Stp1SqymmhDqg16bOZLBBx3oy0lxlAjaRQRL/NFXMcWsvyM9K2LPbkLRN7lFh5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gVHH6+w6le0xTHPAQTaeEYW7nDPuhbJZlCxYM0Qfygw=;
	b=RCdRRJVEPnUhr57cyOV/cvWgXWAM8Nx+XoxR4zQFBXE5H4B9aT/mV7y9F67JJ0fAm0tW
	 mKg+NnMRl8Khj3qJzkVpw+9vTVuKf+CasisX2747RC1T+ATUp53PpqpypvF1jrwJP/2h/
	 RY87MARFlUfsUgmwQtJIiPVf/GKTuwSnG6AXAZb42jn/4KeBBdo+AoZMnS9rhGnITaIQq
	 F9Z9D1Er8+z2znP0DG4Ylcd93hiWe88gu18mVWSPNJRFFkoH4v2d5DxVNxdJEoro17fwy
	 BCIVXRY2WqS7w20+Luuisw0ymPy/WX+2FA+yXLQGRaEt1YDlpehIn0GOLJ3VPizCzZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVqvKH5+;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E766606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E766606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NVqvKH5+
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38692f62b22so10064688eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795749775; x=1796354575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVHH6+w6le0xTHPAQTaeEYW7nDPuhbJZlCxYM0Qfygw=;
        b=NVqvKH5+lsTodiBLJrm31BYjG5CR5qysR7PW+JLyD1KrTWmHn87Y5QtlZhbOEVlcgT
         gpl7ODF5hxKwBlctYepCz0cihw/9QyiRSKBk5rlK1hxAwhIXnL2EeASnhia07xALY1fG
         d5f9CrxXgpXvnuP8NX031iTiXSQsBitNr+gG4ZONz318AXtdie4lfU1TSzggS+1oJRBN
         i3wIa0xYsWZTQ3dmXlMY7iZrsUSlFmjbhnM3yiH7H65SY5dr4o+TT53iFctxcBZ+C/1+
         ahpAfSJVyWv/ub0KDiBS8IVAaOZ4QCWwIzdF+zAKXazEUsNFimO+pld03eX96mTyiPGn
         UosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749775; x=1796354575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVHH6+w6le0xTHPAQTaeEYW7nDPuhbJZlCxYM0Qfygw=;
        b=UMdxzfyUMb5JVyyXErDFJxSwo3wn1KXlmhCX1HLGR0xmEZxR1CuEEpsCox9Q6LmbZt
         6KM4OtPCP3TgYaiB/DLtE8E6ATs07V+qFwLoVJgw0qX0MjkelnjvfGkfJ8h3sLmExEv2
         GdabzoWjLu7kiDrNVPH3176blkPQpnhOir6VscOwECW6m9wr+2sCQV57dhF/lOBRj5Zz
         klpSVcyryAwO8rwHw/YMSPb3v0Onm+MOO4o8UiosZLEJMNqrsEZKJB3veudzSCSzs8Vy
         hxMdAEX6/SIqEB3f6f+6MNyso7E3dawKNgOj6pu/QKKRb5Ry+PqrXTkw8djdINxyt7i3
         LZDQ==
X-Gm-Message-State: APuU4Z8k/YyygsxxlCqQ0QEcJSZnoBjlUzx0iJeQeQEhvwGguFvMJvIp
	NJj289kckcJ1JcaUlNsk7OdcjsEL3Je3kdKdQ+d0IrA/YGnLNCYYYGWu7tIy4g==
X-Gm-Gg: AZFdTZfjf6isn38VI5/OPglXmvN1xEqKOFWJ9HYISHKDSmAlN2fRohBihN2JdET2aje
	V2TdG8zgwBQ4xlMk8cQo45hmiDVHkmL6DlzznIyY8OhOO4qMHz59isBIuLKeD/znZmD3KtIDTlL
	B/FVh56IGKwQ+WfmJ8lQgT3opg5bNhoN5CafhIRJmU2MR0wWswglNGn02oJqrHW9lmBNOrGhX8r
	Liwkt9KhcVyLIwYFP0K/hIDfDUYaSepozk05M9h8QfT02DtOKEiOd1278u+cSs6MyQrLHRdCX5U
	tP0Qs2LvKDKnrrptOOFxMFBmv8vkuHZRGZpAFL/X8hRlmB4vip8WWjQ+tli/rxqalbWeZQ+wTvB
	BOLA71mXBxSH9Z6NYP/QkJzRkDm+d1ni0CqUHLNuYpF0XrJmv9K4BRQE+LEk09m6YvrLhCmfNIU
	I1s4WCtn/k4iJcS65YsMlHf26Ohd0XH+hYJtJOdG2fbSBrtdpskCZ2lHDrB25itTfSUvPTspZsT
	Gi/qtyAcKhAi9haOqV/Dahs9tSrbfZJ28vQ5TgrAlGsC2z59asK8Sy4fhCAR7O0yCM1bo0sQYlf
	pRIM6ohcfE7qWumXTNv+XtcaTr9acOwm/+tkKL9izV2GrpMvPbVcgDsqi2G1i69j+Ep5MQWIx1q
	NLd07Ydr+sbXRogNzGLhMQYNv7JeqYFWZdS8ZO0E/YFG3uXrQyF/iljVB0/rhcDsZXYYu/qwZVg
	==
X-Received: by 2002:a05:7300:2728:b0:383:c2f0:e753 with SMTP id 5a478bee46e88-3856c0d0a68mr26266744eec.3.1795749775103;
        Thu, 26 Nov 2026 19:22:55 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm81845568eec.10.2026.11.26.19.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:22:54 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
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
Subject: [PATCH net v10 0/2] genetlink: Reject joining multicast groups no family owns
Date: Fri, 27 Nov 2026 03:22:44 +0000
Message-Id: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
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

v10:
- In the selftest, unload drop_monitor only after the test loaded it,
  and ignore a missing modprobe, so that a skip cannot become a
  failure (Sashiko).
- Say in the skip message and the commit message that kernels before
  v6.17 skip the checks, as they have no fixed nsfs inode (Sashiko).
- Decode only the membership bytes the kernel copied (Sashiko).
- Patch 1 is unchanged.

v9: https://lore.kernel.org/netdev/20261125144514.2717012-1-anilkaushikwireless@gmail.com/
- In the selftest, find the initial network namespace with its fixed
  nsfs inode number, not by comparing with PID 1, which is in the same
  namespace as the test in a container (Sashiko).
- Unload drop_monitor at the end of the selftest, so that the next run
  does not skip that check (Sashiko).
- Patch 1 is unchanged. The Sashiko point on it in v8, a family
  unregistered during the join, is the window the commit message
  describes. The fix for it was patch 2 of v5, which was not accepted.

v8: https://lore.kernel.org/netdev/20261123155503.2497063-1-anilkaushikwireless@gmail.com/

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
 tools/testing/selftests/net/nl_genl_mcast.py | 138 +++++++++++++++++++
 6 files changed, 154 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 7b0c5f0c757cb61e28dc4128633877aaa8f6f9bd
-- 
2.25.1

