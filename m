Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.143.172.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913854;
	b=m/HkPjIwjXTGI1EHylO5cz5i2qIoL4k/FYQPy+/koSOlvyLJWliWhr+JSWF+nhJVf9u5
	 cEoN5ks8frOVnkYHuOG3J0VtER+FokDVAFrujx0pcvgoxDElFanbY+gLhsrwDkJiy272x
	 +QO+XpSym7/Hxr1h2+16hhlXvJPnqTojqCNtknjHuJt6vq3dz3D0YfmsWG/+fF3/9sMUp
	 f9zXEx5bpN40+T1jtZteZd6Zqd4rIaKEKCNdzzJ/kaNSS5dsmcIf/mDliBZtiEtyrnz2M
	 o+gRXx4kD4BeXhicNRbM8sMghQb+5hdFdRaBX/wiXkGh6Ifu/j+OPgNqB+MBFeWmGww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913854;
	h=DMARC-Filter:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Rspamd-Bar:X-Rspamd-Report:
	 X-Rspamd-Score:DKIM-Signature;
	bh=XBlaEP+ZZalLn+AMLvWxVAh3MLL2GxgeVb07XFzJTew=;
	b=nKysEG7trWvKT69KKXWh15/oPS8AYa3U+T9YlOetd4g7ROVMRKcACkS6722u+qokI2pZ
	 IfGKRKShn3RCZixMB2IxLpIXIems388eYQ898KxvbUICHnBjMfZKaMzz/RK9HvIvts7hc
	 yp/pbReq/nYZ9rHdPp3Ut8GmWgwESiifoZHacaNU1Eyfp1O6nBq4E1mOpVF+ITJcRZBOq
	 eCxK8wLRNlAt53Dv2oComGr3tvV0wqvblxUpLjlfMX9324OZelw85BljuEd6E8V3cQF/9
	 aS3epj189SsRLJSrmhBF7Fs+dH0MLGgtReWj9SSlBVMuIN9oF5LOvvhHGHdin4wOSaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lausen.nl;
	spf=pass smtp.mailfrom=lausen.nl;
	dkim=pass header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=GcmRvluN;
	arc=none smtp.remote-ip=95.143.172.20
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189CF606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 11:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 189CF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=lausen.nl header.i=@lausen.nl header.a=rsa-sha256 header.s=uberspace header.b=GcmRvluN
Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 6B03360C63
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:10:52 +0100 (CET)
Received: (qmail 10627 invoked by uid 990); 17 Nov 2026 11:10:52 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unknown) (::1)
	by devico.uberspace.de (Haraka/3.1.1) with ESMTPSA; Tue, 17 Nov 2026 12:10:52 +0100
Message-ID: <dd6010d1-c076-44b2-9f2d-b532a0981699@lausen.nl>
Date: Tue, 17 Nov 2026 12:10:50 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 0/3] ipv6: Honor prefix suppression for FIB lookups
 and cached routes
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 Shuah Khan <shuah@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116150132.9594-1-leonard@lausen.nl>
 <20261117091340.GA581197@shredder>
Content-Language: en-US
From: Leonard Lausen <leonard@lausen.nl>
In-Reply-To: <20261117091340.GA581197@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-2.999967) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.089967
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from:to:cc:subject:date;
	bh=eNHCyMzMjuTxFdiDys0ATKEpEOHWN3JbqfwqPu9B3g4=;
	b=GcmRvluNpm4yG+//tqMK3Dv5u4jTtT7PT4TzuyzAT3iQvi4Gm/bfjxiEPVINkZf7DbYR9BZrUc
	U6qaCOrJD8GyQDzlv3yuJDtNUtqi863BL0wSY3GrHaxu206a+4nig+GpGGzWYc86/oHr1ra46vSW
	EU4YRyUkVe1n6kx2ZZBDUXWfJFBDjJoLCoL8mzzSnHThcoE9zIUatyaHmpYOmNW+rW1cPOyuf219
	/89S7/9rZOftBpkpN3MuXzw7S4aDS2A8BaUN1dttP6Sl6+/sgvRfYhqz02PEghySC65cGrpHiGDu
	HO8qAWOr7toDFdA1TRrmZsyQu4KJpIlAVMcwucb/5LZnj9LuBPAiHec862cfAxwHkRD0+2dsw6/Y
	EJlDnCmme3bwZq10N+NqYGbKMmYucNbTMSg/O1xq2+ykovonWwQW87Ec+TNt6AERxVLX7OMPXnOw
	/HpgFYlUG5wI15i4FFZZ2WTI+hmTycfbOPrFqA2f3AzqamuwIrbR8o5UB0py2sokrS7dBPFJ1DHj
	435qEKSypspEnoHzVOWXRVsxbl/1pA+OIkL1kN77U7+mYbL2Xc0cszP3C7Mb+u28Pv9moT0/LCmE
	TMLjBnFUxO8qy+rEFVf8GsBg+nDt3LPa41Vj/BnIy6+oChpWBpwzWPkesk/MNfxB9jJpM65lvtEb
	8=

Hi Ido,

didn't realize it needs to be separated due to net-next and had included 
it in v3 as it seemed straightforward enough. Will resend to net-next 
after this series made it there. Apologies.

Best regards
Leonard

Am 17.11.26 um 10:13 schrieb Ido Schimmel:
> On Mon, Nov 16, 2026 at 03:01:27PM +0000, Leonard Lausen wrote:
>> Changes since v2:
>> - Add the separate cached-exception fix and PMTU regression case.
> 
> Why?
> 
> I said (twice) that I will take care of it. It's not net material
> (always broken) and should be routed via net-next. Please send v4
> without the exception "fix" and the related test case.
> 
> Given you already have a patch for this, send it to net-next *after* the
> fix is present there.

