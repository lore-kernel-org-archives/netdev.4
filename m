Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.206.34.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994293;
	b=Vn3R4Ja4tZS60cOIs2ESOFJk7QVs5a/MGCTv6yQ7P1unyBbPfRzvNtgN3RQnGCkZmOlS
	 cWQk/LSL+b84u2gHzZWDJMS1yIr4PO4WEyz9N/8qCfy9TP3r0HQ58rmv9NBnwIwfBpFP8
	 NU32THFXB3601vB0s08ig47PqEICJEGCHPzRBo9y0+HDi8ZG18GFTcsQQuJGmEza/wTwe
	 Z4WiVagw+DK3egCfC61MT/xUVKofokjkyz+wtPNpzCuMsGNEZRwhUOrpqZ/hRy5ikhkbw
	 QK5Snjb8l1krIUghqB+5M1YkZyVjzSE0NE3GQGoEPl0D2VgWNj7bSbLxCq3jFmZZwKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994293;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=WbXjRcmv5Q9c6A6qHp7r1CI4v3WlKTONamERQ5pV0D8=;
	b=QI4/yv7cOb/SsY6hF1gJ25TJMsAuNtYK/a1RQCGuJjTMpJBV1TnMZ/e/yMgw+6Ct6yQ9
	 DKUjfZ3h/DHTWMuQNR0gljstdBqU+JsYJNWmz5gK/PdOEpygePrrbexJbb+yRmSxUq9eu
	 4vCgPzL1Id2Odk0QkGV8hpUUKsgUx9jBn9boN+UJiuvsA8LnOIRN/g5WGDpXKSgAm3UVD
	 WpfU2jdjeKCikeSUpy8LM+55VZbOTvATlMGfat5yQ4V3KZal7yKdRk0k7VJ7K593jHvP4
	 AKQBcBSCh51Xn5GaSKI3z3AkuKcXViMrldBPY5+jqk7LsnqfJv3ayA/DNPOQ+4XU03A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=net-swift.com;
	spf=pass smtp.mailfrom=net-swift.com;
	arc=none smtp.remote-ip=54.206.34.216
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B7E606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B7E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=net-swift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=net-swift.com
X-QQ-mid: zesmtpsz2t1794994207t75c03935
X-QQ-Originating-IP: X+G/UKdREG6Ro38DMbrt9xp4krgiJ4by+jqrXwZjXl0=
Received: from smtpclient.apple ( [115.204.248.161])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 18 Nov 2026 17:30:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17219351572651200833
EX-QQ-RecipientCnt: 13
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH net v8 0/2] net: wangxun: protect ring accesses with RCU
From: "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>
In-Reply-To: <179498992591.3291.11634378826963805001@kernel.org>
Date: Wed, 18 Nov 2026 17:29:53 +0800
Cc: netdev@vger.kernel.org,
 jiawenwu@trustnetic.com,
 duanqiangwen@net-swift.com,
 linglingzhang@net-swift.com,
 andrew+netdev@lunn.ch,
 davem@davemloft.net,
 edumazet@google.com,
 kuba@kernel.org,
 pabeni@redhat.com,
 hramamurthy@google.com,
 jacob.e.keller@intel.com,
 przemyslaw.kitszel@intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <2575C8F8-6A19-4A07-BA73-8E54E92C5704@net-swift.com>
References: <20261118081329.39551-1-mengyuanlou@net-swift.com>
 <179498992591.3291.11634378826963805001@kernel.org>
To: netdev-bot+sinfo@kernel.org
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:net-swift.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MkuEu2QIZjhqpt5XQJt35+XlyNsEV7M58YjbLGXV9/DezfPvxCu3xbEF
	a3i73Ut/9XN5/KcV1ZhM7yrxWR4ap/Gj6RPZ8f+D5Aga36POFJdGlSlDHP3+RZQ56GkvavE
	Mnw+M5/7gCQrRu0J39aOHcaUe7gPLSTnfbJUc0OdBzL3s0OZWqyoM1B8+iBqYzuGGk5EiIU
	xLbfGnAqPXjji61vG2n4/7Pxn3DZbB+39vEs1FeSrooFJopUp0W/C0STbrcz2lig6cBvtBT
	8UK9Nkmy59LQJgqOAKRiiX0rMUvogWjQrdqVqZMa8ObeblBtnvm9iwvbL4aRgm7aK91w8co
	etqZyI2/H+C3wZr8KmMfRQILfdabCgL6CbHDtq3V0YmORMInhogi8Z+6i6RIeEkpt7hbT1y
	4Xh0p7AdAkFs6Z8/maj84dpFkG0fk7L2YGYakFdl1QaP4M7o1NIvZpOwayNh97NhY7+gKly
	6+gzyjEByGMTF2EdtaFN3Y6QHG8KNDCyYQSV9nG/IpRpOdNGs+lqoY2W4YMaJ4IfDPyIsIW
	39Jk0NqIy8FeFk5kcx2tRGgr5uLehJiYc7pEtEbG304WWP66hKmaM+yCJK68tmIijzqaVYB
	t9PDmyX7ruuBs0lkmPv8eLTX9XnAa0IlG3Z+RXLBGMuDiXALFw5/y/y/czx/h6TvzDi09WQ
	VTZ0Mi6YD8j8dCF1AJGgARqEvB5UOf0lN+uANe31VS33IBPonQIyahKapenPVzCanCbEjDr
	mgJ4XxsjfkOUZuTfIogd5aTock789sa5UmFROCZhYfjzELATo4HPua0+u4biJjMa5nd6Fb/
	ANkIK5DuJMl9UsDWa1Jxi46v9dPtEEjXxXsw77MOmxrTzZPl2acJLvJJuL+R4aH+CNx2qrZ
	dwpIUDhdr8i+k7VsxjxABeqMlYZsB9H7XUw5m9Om+bnwScs8SlDJ6FtiwAjBzj8gbcioZJq
	d0yPp2r3NESI8YsCsoI7eP07F0PF+u6Cj+t4Sn3L1eojGC9edEzZHE+YFmSJPWRnUkUkt+Z
	MOwmMvrbyC2vvv5kxb7nxbt65+LFL4IArSqfcpPbUUf75kVD96s1hQDdWfj/rPDs1Dm/fj3
	KGxzaLgVQyZGcI2lMA0WWqHn+JtoBB1wHYUQ5ZKJvO6
X-QQ-XMRINFO: NI4Ajvh11aEjRrMUeaP4GIlWlgv8PawsGg==
X-QQ-RECHKSPAM: 0



> 2026=E5=B9=B411=E6=9C=8818=E6=97=A5 =
16:18=EF=BC=8Cnetdev-bot+sinfo@kernel.org =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.
1) Discovery: The issue was found by code inspection of the wangxun
   ring/q_vector teardown paths, assisted by an LLM-based static
   analysis/review tool. The starting point was commit 3f703186113f
   ("net: libwx: Add irq flow functions"), where the TX/RX ring
   pointers and queue counts are accessed from lockless contexts
   (xmit, watchdog, PTP, ethtool) while teardown frees the q_vectors
   via kfree_rcu(). No external bug report was involved.

>=20
> - Whether the issue was actually triggered, or is only theoretical
>   (e.g. found by LLM and not proven at runtime). If it was triggered
>   please include the symptoms, like the stack trace or kernel =
messages.
2) Triggered: Not so far. This is a race condition and the timing
   window is very narrow, so we were not able to reproduce the failure
   on the tested hardware. At this point it remains a theoretical =
concern
   identified by inspection rather than an observed crash or KCSAN =
report;
   the series is a preventive hardening fix.
>=20
> - What hardware the change was tested on. For driver fixes please
>   mention the device (and if relevant firmware version) used for
>   testing, or say that the change was not tested on real hardware.
3) Testing: The change was tested on WX1820 (TXGBE_DEV_ID_WX1820) and
   WX1860A4 (NGBE_DEV_ID_EM_WX1860A4) NICs. We confirmed that no other
   functionality was affected.
>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>=20
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
>=20
>=20

