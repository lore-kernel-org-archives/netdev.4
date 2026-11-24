Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795499263;
	b=ypRPA2Zu5iYmT5HpJiO48nNm2PA3q0G82BWWHmIccRInR9Be5NOlQimWzfMpWZnZOV6Z
	 rRcixgsNpJC+/+Bqp+bxqdTLTT9HGzOQ3qqrdL3+hBVMItcbOn86cpt99lGZYZsTxsDAx
	 4bRhRkWXCi860r/S/GJwhB/IaihJ1iiWK+viIcMWFVAMqj32x1r5Wa13UNcYzzaEk0vgV
	 UneOJwQfyaMcJf0b6L44MhTBkZG8oQlyiG5scK7tMFsr8Os7CZ8GOmeZ6bAmNnf1qQUpk
	 bTJejviaxZJZTd+xFgoIx2ZU9764fCanIqwxkWV2Eu0rur25ceYXqMlCR8VsnrD25pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795499263;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2942f0EcNrAJjC2YXD+QtpsaftZMjyCf5nWFdFWQhug=;
	b=wy2LP1ITUBRn2PnbrA1kO+9lAVhMGAwEv9d41bcZ1fXK9XgTfVVWyg3Q0154/wliHZ5k
	 N79Zs3bm/w+F0kkOc0U1XcOJIbBedogYmFM65zwy6PSAhrnms2XCig1qQCS402FIwu5kH
	 Q0F5qSoBuWj4noC59+xpUyxXqfYcrMWs1grPhi2cDSfVJApq0DFTC2PVo23b6l2/YwDw0
	 HQRZDxIRVsJuuEqhgKtuOjfovl2MuExlU34Aq2Ap1PntFLl/haY1YAbVwpu3v2xQVx+5z
	 AC2e7qG5e+/Vegsr5S+eqZ4K6P4sL0SB1JDE75/XMGXrwYKUgRYB+PZzuEymG1tWO0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="V2O/dY+m";
	arc=none smtp.remote-ip=91.218.175.153
Received: from mta0.migadu.com (out-153.mta0.migadu.com [91.218.175.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AD0606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13AD0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V2O/dY+m
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=55+Ze73XLUGRyfH+eSGT9jj/xqUX21ySQEW4J4NGZB4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795499259; v=1; x=1796104059;
 b=V2O/dY+mtQLQd61d4OlBgccq1V9R/pNc3w/4aVAo1U+fTFwGSm3ITeq7YDRkDUCQlcrvzthB
 4yhRYzihDcnis45/tWbBcsGnQINmOZoN5bIpqg9/UOhe2JYOVsFOQHzo6P/cEgTPv+XdQxVJEkv
 +8uPrtSDqJ+CewMoA8umFmY8=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 9ce4ce6d35c60903;
	Tue, 24 Nov 2026 05:47:38 +0000
X-Mizu-Trace-ID: 9ce4ce6d35c60903
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 13:47:29 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hangbin Liu <liuhangbin@kylinos.cn>,
	Stefano Salsano <stefano.salsano@uniroma2.it>,
	Justin Iurman <justin.iurman@gmail.com>,
	Andrea Mayer <andrea@common-net.org>
Subject: Re: [PATCH net-next v4 5/5] selftests: seg6: add PSP flavor testing
 for SRv6 End.X
Message-ID: <20261124054729.GA14932@Liu-laptop>
References: <20261119-srv6_flavors_endx-v4-0-284cdb484eee@kylinos.cn>
 <20261119-srv6_flavors_endx-v4-5-284cdb484eee@kylinos.cn>
 <20261123050952.21dc46abdf5fe4fa235bb68d@uniroma2.it>
 <4717cab46b8eec796eb97799240cd6ab92d8c1ed@linux.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4717cab46b8eec796eb97799240cd6ab92d8c1ed@linux.dev>

On Mon, Nov 23, 2026 at 01:40:27PM +0000, hangbin.liu@linux.dev wrote:
> November 23, 2026 at 12:09 PM, "Andrea Mayer" <andrea.mayer@uniroma2.it> wrote:
> > 
> > On Thu, 19 Nov 2026 21:55:21 +0800
> > Hangbin Liu <hangbin.liu@linux.dev> wrote:
> > 
> > > 
> > > [snip]
> > >  @@ -1031,6 +1187,25 @@ setup_end_flv_psp()
> > >  SETUP_ERR=0
> > >  }
> > >  
> > >  +setup_endx_flv_psp()
> > >  +{
> > >  + SETUP_ERR=1
> > >  +
> > >  + setup_hs_lo_addr 1 1 "${ENDX_CSID_PSP_FUNC}"
> > >  + setup_hs_lo_addr 2 2 "${ENDX_CSID_PSP_FUNC}"
> > >  +
> > >  + # The same SRv6 policies with setup_end_flv_psp except using End.X
> > >  + setup_rt_policy_ipv6 2 1 "3>4:noflv:End.X 4>2:psp:End.X 2>h:psp:End.X"
> > >  + setup_rt_policy_ipv6 1 2 "1>h:psp:End.X"
> > >  +
> > >  + setup_rt_policy_ipv6 "2:${ENDX_CSID_PSP_FUNC}" 1 \
> > >  + "3>4:next-csid,psp:End.X 4>2,2>h:next-csid,psp:End.X"
> > >  + setup_rt_policy_ipv6 "1:${ENDX_CSID_PSP_FUNC}" 2 \
> > >  + "4>3,3>1,1>h:next-csid,psp:End.X"
> > >  +
> > >  + SETUP_ERR=0
> > >  +}
> > > 
> > On v3, Sashiko asked whether the End.X tests would pass with End.X
> > working as End. In this topology, the nh6 of each End.X is also the
> > next hop that a lookup of the new DA gives, and the tests pass in both
> > cases. An unreachable route in table 90 for the next SID, on rt-4 for
> > (i.a) and on rt-3 for (i.c), would make End fail and leave End.X
> > working. This is close to what Sashiko suggested on v3. What do you
> > think about adding these two routes to the End.X scenario, each with
> > its defer?
> > 
> 
> Oh, for i.a), do you mean add an unreach rt-2 SID on rt-4?
> e.g. fcfcff:2::/32 unreachable? If yes, based on
> 
> #   (i.a) hs-1 -> hs-2: on the packets with DA=fcff:3::400a, rt-1 inserts the   
> #         extra SRH with SID List=fcff:4::e,fcff:3::400a, and rt-4 consumes
> #         it. 
> #         Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2        
> #   (i.c) hs-1 -> hs-2: on the packets with DA=fcbb:0:34a9::, rt-1 inserts the  
> #         extra SRH with SID List=fcff:4::e,fcbb:0:34a9::, and rt-4 consumes
> #         it.
> #         Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2
> 
> I think we should add the unreach rt-4 SID on rt-3, e.g. fcff:4::/32 and fcbb:4::/32,
> because we need to use the neighbour route on rt-4 to redirect packet to rt-3 after
> End action. What do you think?

 (i.a) hs-1 -> hs-2: on the packets with DA=fcff:3::400a, rt-1 inserts the
       extra SRH with SID List=fcff:4::e,fcff:3::400a, and rt-4 consumes it.
       Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2
 (i.b) hs-2 -> hs-1: on the packets with DA=fcff:1::0af1, rt-2 inserts the
       extra SRH with SID List=fcff:3::e,fcff:1::0af1, and rt-3 consumes it.
       Path: hs-2 -> rt-2 [ -> rt-3 ] -> rt-1 -> hs-1
 (i.c) hs-1 -> hs-2: on the packets with DA=fcbb:0:34a9::, rt-1 inserts the
       extra SRH with SID List=fcff:4::e,fcbb:0:34a9::, and rt-4 consumes it.
       Path: hs-1 -> rt-1 [ -> rt-4 ] -> rt-3 -> rt-4 -> rt-2 -> hs-2
 (i.d) hs-2 -> hs-1: on the packets with DA=fcbb:0:43a9:31a9:10a9::, rt-2
       inserts the extra SRH with SID List=fcff:3::e,fcbb:0:43a9:31a9:10a9::,
       and rt-3 consumes it.
       Path: hs-2 -> rt-2 [ -> rt-3 ] -> rt-4 -> rt-3 -> rt-1 -> hs-1

Ah, add unreach rt-4 SID (fcbb:0:4000::/36) on rt-3 will break the path for (1.d)
testing, as we use End action on rt-3 and redirect via the route. Can we just
add the unreach route (fcff:4::/32) on rt-3 for (1.a) ?

Thanks
Hangbin
