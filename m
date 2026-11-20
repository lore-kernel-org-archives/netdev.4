Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.75.19.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162673;
	b=Mcbvtl6B/Ta1YuZcjBnJIcZTMk6lNZpaCe1MFRj0FutlbVo2JRPNUnS4qxdYnTaV2Fe7
	 4VdcBPy6LKVlD3XzNZgnDan2bZXzzSg/5xzz1lh1MRKpm0/RLxfNq2G06VrbHhD3ctUqo
	 aeuILtuRJK6/DYqpFM77ttKJHri8LTsGe1P+uVtfKMDRc6q8Pg4cC9zE7EJmQiGYX0nyM
	 R5V2q4hf4WZSnMMzCd5sNJMrGTQGqYnxX0tG3hgII3DtNmxaP1zb1AR/4yOznyZ0rjwDd
	 l23HSvZztWpIL0iFczAyMf8kBlBaPsqfgWsOHAIOSzXqmwn8HVXTl1A3sBQQL6IxvaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162673;
	h=DMARC-Filter:Received:Received:Date:From:To:CC:Subject:User-Agent:
	 In-Reply-To:References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FjksMNsY7qsz5cAZYeejgsF6pr4fP4vVTCrvV8Vs/CM=;
	b=1nIUdgoEk4GqobOEc38L59ekS8ECG97y4MOB6Locpr+WaS427rtEDFZ4RqgmG5+jzB85
	 zCTfhGegl4FFooMdaH6vnqCRlZCQIUUGeUylrBsx94TLhmLTXuYOijGamEvgusf02OK+k
	 QfgagWPeXFUHUfxeZONuWTt/yd5if1hHLDtvcX1PpNEB0vpzjtscrHDl8Z8m2Fxr90h0f
	 m9WYzVLy06asBQ0BwF+lYfW269UVsouKHUdkPLuDhsVvhmnxbK/HsfLnO3OFA3jv4Tq29
	 ioC+ygO09SdmBceRmeeqI9oulBn/Jdiu5YHYLcIDDInLXX+mWJarAYcsy6bN/2b48wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=remlab.net;
	spf=pass smtp.mailfrom=remlab.net;
	arc=none smtp.remote-ip=51.75.19.47
Received: from ursule.remlab.net (ursule.remlab.net [51.75.19.47])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98EB8606A320;
	Fri, 20 Nov 2026 08:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98EB8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=remlab.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remlab.net
Received: from ursule.remlab.net (localhost [IPv6:::1])
	by ursule.remlab.net (Postfix) with ESMTP id 0A64BC0030;
	Fri, 20 Nov 2026 10:17:44 +0200 (EET)
Received: from ehlo.thunderbird.net ([2001:14bb:69d:726c::453:2301])
	by ursule.remlab.net with ESMTPSA
	id 4T0xMygCAGu2MAMAwZXkwQ
	(envelope-from <remi@remlab.net>); Fri, 20 Nov 2026 10:17:44 +0200
Date: Fri, 20 Nov 2026 10:17:44 +0200
From: =?ISO-8859-1?Q?R=E9mi_Denis-Courmont?= <remi@remlab.net>
To: Andrey Misiurov <amisiurov@cloudlinux.com>,
 =?ISO-8859-1?Q?R=E9mi_Denis-Courmont?= <courmisch@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>, Morduan Zang <zhangdandan@uniontech.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] phonet: do not autobind a socket to port 0
User-Agent: K-9 Mail for Android
In-Reply-To: <20261119122127.1708071-1-amisiurov@cloudlinux.com>
References: <20261119122127.1708071-1-amisiurov@cloudlinux.com>
Message-ID: <4EF8BD03-097D-42B7-A49B-4BC92AA742B1@remlab.net>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Le 19 novembre 2026 14:21:27 GMT+02:00, Andrey Misiurov <amisiurov@cloudli=
nux=2Ecom> a =C3=A9crit :
>pn_sock_get_port() walks the local port range to pick a free port for an
>autobinding socket=2E net=2Ephonet=2Elocal_port_range may start at 0 beca=
use the
>sysctl lower bound is 0, so the very first candidate can be port 0=2E
>
>For port 0 pn_find_sock_by_sa() falls back to matching by resource and
>usually returns NULL, so port 0 is accepted=2E The socket then gets
>pn->sobject =3D pn_object(0, 0) =3D=3D 0 and is hashed into bucket 0=2E T=
he next
>lookup that walks bucket 0 -- another autobind, the same socket's next
>sendmsg, or an incoming packet to an object whose low nibble is 0 -- hits
>BUG_ON(!pn->sobject) in pn_find_sock_by_sa():
>
>  kernel BUG at net/phonet/socket=2Ec:77!
>  Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN
>  CPU: 1 PID: 6883 Comm: phonet_bug
>  RIP: 0010:pn_find_sock_by_sa+0x3a9/0x590 [phonet]
>  Call Trace:
>   pn_sock_get_port+0x1da/0x4b0 [phonet]
>   pn_socket_bind+0x312/0x580 [phonet]
>   pn_socket_autobind+0xaf/0x160 [phonet]
>   pn_socket_sendmsg+0x4b/0xe0 [phonet]
>   __sock_sendmsg+0x1ab/0x200
>   __sys_sendto+0x1eb/0x300
>   __x64_sys_sendto+0xe8/0x1d0
>   do_syscall_64+0x102/0x2d0
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
>It is deterministic and triggerable by an unprivileged socket=2E Skip por=
t 0
>when searching for a free port; 0 is reserved for the unbound state and m=
ust
>never be handed out=2E
>
>Fixes: 5b0c911bcdbd ("net: phonet: do not BUG_ON() in pn_socket_autobind(=
) on failed bind")
>Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux=2Ecom>

Acked-by: R=C3=A9mi Denis-Courmont <courmisch@gmail=2Ecom>
