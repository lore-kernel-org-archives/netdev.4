Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995955;
	b=3ROBQwcidayoAZ2zlivyuZEzsiUEVvGjrOjkdmohMsURk326K+p34IVVuHLvawLKc5qg
	 Yyo9gkq3aNXYyyNz2fvt6znGbo584r4G4RPHVshaVjiIrCk0AD67FCX+seBmzOfLZEdlx
	 SLz8JITk9ZxT6dh6g/m2By02BmjkVm8AYc8qaPTSrPHtqOhOhro4B6eKVfo9Ja+7enBeT
	 pwdORIHV7sE2bJVive1R3zO3RJW9NZ9qo/kV4BNlsEZ+CwL3XFI+UGCoKTBlapWA2DceQ
	 qTldyM5mVAZA04j9oO+vLCbohnq3uAqqv8xxH4+a2E+APPV7sVxfvrzuhBLbQh/NlAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995955;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KNY2M/fmXrSXPZE6dfYyhD4mnK5YqzJmB4aUM3PR9tY=;
	b=UD5/Muc2t5rxq/ykZjn/98Sq7QSwnun1mzW/Gn4YX+KxFmVkv3UK2JeKrBFKPb4DYGGB
	 luE7XW3os5KYSgYrHllLzTCEGFcw6xR+0t4nRXjpQTiL3BX1IhlV8YP0ixbSv2GBR7aSo
	 1gWpeGT5Eb3feVm7+Vh47F+xDh0Uo+8zG1/oVuqK3DlJAArT5PJsUprAxF9mB57fS6b4/
	 sXDlNKcf5ElqG0DMM1FhUqSdpvHMur40jHwfutw8ZXnNGdrnVlVvS/ZzsJrp4wVf9wiMM
	 SzeusGu+s90AVWjHwZCD76HCsRCS0oYfHDyL3e7BDqGq7IeyAE75NZczb+/p3SOUcmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b="BhgiOj/n";
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DE6606A32A
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 09:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DE6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=BhgiOj/n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794995949; bh=KNY2M/fmXrSXPZE6dfYyhD4mnK5YqzJmB4aUM3PR9tY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BhgiOj/ncXhpF5vary89hN3m7yvy6VADYf1+QjeQ6qpVdlo0xrERJGmVFquQv1Cr7
	 Cio53lS19byJnHE8j0+z4uCi6KKteOoDJrwvRO5vionUQwP13dR3eqRFfhWYCJUrnZ
	 f0rB+DNF+yNVYFldRRJ1toko6A1sqfAFaiGe67fo=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id EC621A71; Wed, 18 Nov 2026 17:59:06 +0800
X-QQ-mid: xmsmtpt1794995946t2bp6uoxd
Message-ID: <tencent_3C854F3EA4A91CD7486C74E2D4FD5A1A8105@qq.com>
X-QQ-XMAILINFO: OV65e10zTgieHUrgl+vZmKoWs25JVNjAr5GEdZdAgNtL166umJcKqj1Zwz8iRq
	 hfgxVCWCdwEYWEdZWMFeumS1vbuS36BPXp4mQji824X3Fl9s+pmCt8GBYTwRbB+NCSZNGm3XGB/8
	 CU5RFqvMH6swXLaM2temLF6fAazXeiJGrCbYw5oEosjUbKi6tTe4Tqk2G1Mu3btfYhHznunf7A3o
	 sa4upeKdQGL0dNKh+s6RcUiiWCPDQvRBpTFBYTVPldr6ztejmE5IZWP06qDXehuydV5R4wXG2K8l
	 xHX/9RkrzdI6ZMT09pULtFFi+Jcv9dJ4BORI5h3Jz/MMySKk0By3LE/zyLmxnrOU/RaVJUnwwS16
	 tCRW3bBa+ZFXje4GFot7lCHa6kvfHiEK/u93r8l8HUEw8T4guceo1jLWByltkXV7DeDmD0C68jie
	 6C5H+y4IXwYzY770hYR67UsLP+8BFzVhIsDrY8FvLgvwITYFuGMuLzRhCnko7d289stV65lDHl5K
	 54bHxWLwQ8vVGrGhQ4WV9YXOCy/efNx/CVjnQ1kraxMcOxc9ckSWeanHrNB/tiBhfTzxmrLBmdUB
	 AzRDLda5voJUm4viLiAXTdzWJPcLJbYlbEks5Gseo2T2+txygFXW2+QV5/e2mMZeCwYzOys/EA9H
	 nP3hZadhNQkRwViIvXYGS6IC0DloxpLqJpizi+oztpNUNEzugDK/8QT6sZJ55fyMQSPs8/FM1l5k
	 aEeupwAFFovCOCVy/f5SFYeIfxDw2pv0+NxPsj4xielyzx3tiLcQ0diYDuytGh0pLoG52dUlBlVH
	 cedlbdeR9+enn+4lvIhnwIFY4qJIcjOfylWjJtQhq8xaKUOmvCLLARXCUEM5hcBrjDD1FUI5kn+P
	 ZEkA+Vp1/ZM3rIfeZc9f6TWbm4X8JnyLQcAm1+HcW7UqPk+P6FaujdWf7GuBo9V/qfYvzfsbBFJy
	 r5v5wtYCGwPvK8PYgGqbvzoNHVTnbTfl0c/ppXzh0MTenrjmwxUzVLSVGkVsOeyP+dGgQ2wnQFYp
	 zYgZeEs+nBuuNHZ7HdZ4XDdcwskHTKAsWMl9EylS4jCZnFShHv
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Shuai Liu <847807867@qq.com>
To: idosch@nvidia.com
Cc: netdev@vger.kernel.org,
	dsahern@kernel.org,
	edumazet@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	syzbot+af16ddc8fd22a1d135f8@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] ipv6: addrconf: regenerate missing host route on RTM_NEWADDR
Date: Wed, 18 Nov 2026 17:59:06 +0800
X-OQ-MSGID: <20261118095906.1015202-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118094948.GA1097953@shredder>
References: <20261118094948.GA1097953@shredder>
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

Hi Ido,

Thanks for the quick review and for pointing me to the September
discussion.

You're right on both counts: the "recovery on NETDEV_UP" reasoning only
holds for the loopback device, and preventing the state (flushing lo's
addresses when the MTU drops below the minimum) is cleaner than
repairing it at RTM_NEWADDR time.

Please consider my patch dropped. I'll look forward to your fix and
will test the syzbot reproducer against it.

Also, apologies for reposting v2 two minutes after v1 -- I've now read
maintainer-netdev.html and won't repost within a 24h period again.

Best regards,
Shuai Liu

