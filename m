Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026680;
	b=4sVfNr9NdhCuVPxTjBl5XLjPjIoKFe7+/4Np+dOl72DwFgjq6t/4gVi05oWmwwalNUMS
	 0zyDRQGSB3yfyhgMeubyAE8Xh+QeBcIDEUk/lvI8Em+2Fx/IAoxZns6ZPeoB8E7RCRMPW
	 ABH1xVJLOr3aFTO/Oslob2A94RsPJydY5+9IHHLJwGGV0e0xLkp8U5z87s+40Ildy+7s2
	 z9lIMhaW5rjOKDDkVcpz9KnNouVXIlooEjz+CiGRWXmQf4vw/gfd0i2H9a8wY7uCHkigo
	 RqkkBNwvwpchf98mNJfb3/oAKZr9kPaC+b1wp5E8QGjrqlaGvjjzyRZwkFiEns/RBoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=9POCCF331g14iFPj8SgUyVVQk9XQYyGlnQIRNxTupwc=;
	b=JQd9WnBAhzZ4Fs5suEaDfClxsuXWLXF8mFyC+2nU7RfFMxls8uG5DzvuCcFPm8ggKeR3
	 c8g9M9cWSERT896aEfABzUtqkD/+j9/XVu4ypO0QO2zuTvnK92IRp9daLegEkPi0p3Bai
	 ykzI3LWEv1UZ6glLRVYxvyHghBMV9Uw9kzrfazqsDZDOpq8ofDPNokRX8dugcJk8ki3Jd
	 yPtP6RdJKHMlud84cyrJfFe/wJxfeRxjKyi22kRQS9NqOpFdFj+98NI1K0BcHeP94Hwb7
	 +lz27pELM9D+TRbAK6aj4Q7fRbK2agsQJjI9ZLbVwpVUHp9mv//rtoa7h+GKvk6+aYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=auoZdRQD;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95582606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 18:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95582606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=auoZdRQD
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso1129366a12.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795026679; x=1795631479; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9POCCF331g14iFPj8SgUyVVQk9XQYyGlnQIRNxTupwc=;
        b=auoZdRQDm9wfrdrbdjIbIBCmSG3H+wyCTqpETgiOZ/ZVrjPf/Z5J5rXr9zk2jaRvU4
         NUyLxRuq5R2mSeKCH/R/xGndSWd6aCzrE+DNEomvHxguAWsRWmcL594JG74+4bReW/kz
         5xgJZP7myRJS6uGd8xRgF0xYXkNTbh2Kh+qh5t0VhTvS5qV9BiE7iYTwdwf69yfQeg1g
         wbtjVnM/udTY73HHLZOpLFtUZE5zQ/FjLtN2xqp0zovfD6yonneE24oN0a7BiB+ns+JK
         /MBhPzUIKT6vnF2Pfrj3BMg8m8cH+BKqCmqfJEHrwPoq+fRNreIphDfG2Z+2OnHl3yHO
         eGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026679; x=1795631479;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9POCCF331g14iFPj8SgUyVVQk9XQYyGlnQIRNxTupwc=;
        b=n9MtmOmucVHFehhc/Q8kUVA8qBN6pXgu3WZuMPh2Bza8BrM+fvzSJ1UoTht/jVUooG
         Qf+FJHlGOLCDaJ1ZjqE4LR5Ywpm6AScA6+FfD0urfhN+PUgoyqWF0fWjmNxs6Cm8N0h5
         BvkbE5+/UZ59oyPQKPq1VApFSz0cSUEw0B3hvXy99d8XKp8ojvfvTsZbkDsoGirzVVEo
         xVQBSyiMh8BASlNS0C5AN+l/JfiKAMDPBQhLAd2XmC+hXeJmBPeUUUmpmn5Op4sXOY7z
         xFeeLumTogSwl0DoRcafCrydVuYk7uYNAApxPdtWMl90GqBO5nWND/kD0fws8zPs07Bp
         R8RQ==
X-Forwarded-Encrypted: i=1; AL+hErH81Uz5Unb9C2dNsljP/a6rNuGs6hTiyILo0y/J5XR3h7n9UnGGs7MKAFQfAPXVrhF1HSARbIw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e2gCOR4wOUSuOSAnJgEq/alFmhtGPSehqSXBn2pFMnaSOF9f/
	El4vGJ5+sCoJBz6kEs6NZKbPvPy1LgLD/qTts0ndpqb3PhnUFzf1/cMhFwc/JqDcGmISJQ==
X-Gm-Gg: AZFdTZdEMXJnLGhRX4HomA8bIPni2cjXygbsqeZ+TLiQGNY6AJCWvX2OnaAz7k1K/Ho
	PUxhB2sufpC3OzhgQfii6prHLuFhx0pfzdlg5tJ9/B+2eDx6AJ0hMkPAwF7guDvIlgTU902hqoS
	BD16trbiCwxvv7hLkAukA/+WsWZOatekEISGXwVOo/uRbnVkKdnMfh0YoMbgUWs0nJjJ/UicMby
	aRoQFkMFbU1vXX1jILodGzfbPf6uss4lfSNDool/dLR+sY9yh+nG0svWjZpkkz0dFqlcGNpkS4t
	ttZypw9BZ9Dc0QtD3edmRdfXC9XCB4nnuqyFuwBMkIKF1apd5us12323tZGx9iX7yAvA6RkNVTE
	u3bicX2/Keqn4HHSzbRsj3QK8iKhn4XsKcYN/CiM/PDdYJdEUXTJp///O1cOoTy4lEgrosdiXNW
	CX20AHtY1jMQVapRSKfx2begGt+0U3SfHVT6iwRHmxTGbGYndV0AggDPfGDfukKA7cT0dEQOYnI
	KNColTEaLrNVLtsmbauJLrf0jU7f/LW+bmCmmlbrLE+U8M3u1FFVNZkRSTZplU5MdSeOeY=
X-Received: by 2002:a17:90a:d445:b0:3b1:4eb6:b3a with SMTP id 98e67ed59e1d1-3b3d0640e47mr3501738a91.8.1795026678945;
        Wed, 18 Nov 2026 10:31:18 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6a94c8fsm421066a91.1.2026.11.18.10.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:31:17 -0800 (PST)
Date: Wed, 18 Nov 2026 10:31:17 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, mptcp@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] mptcp: pm: WARNING in mptcp_check_listen_stop() when listen
 fails on a new endpoint listener
In-Reply-To: <5d651146-b21d-44da-9f15-860f0c9c2dc5@kernel.org>
References: <179502042942.2742790.17887994424282536144@gmail.com>
 <5d651146-b21d-44da-9f15-860f0c9c2dc5@kernel.org>
Message-ID: <179502653236.3033236.9177220287548482679@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Matt,

On 18/11/2026 19:18, Matthieu Baerts wrote:
> Please always decode stacktraces with ./scripts/decode_stacktrace.sh.

I'll keep that in mind and decode them in my next reports.

> Out of curiosity: if your LLM has already analysed the root cause and
> has a reproducer, why not ask to generate a fix and send this patch
> instead of the bug report?

I'm more used to communities like LLVM, which are cautious about
LLM-generated patches, and I was hesitant to send a fix for code I
don't know well, made in a way I couldn't fully judge. So I only sent
the root cause analysis. Thanks for explaining; I'll send a tested
patch with later reports when I can.

For this one we do have a small candidate fix, tested with the
reproducer: it puts the MPTCP socket back to TCP_CLOSE when
__inet_listen_sk() fails. Since you already have a fix for v2, would it
still help if we posted it, or should we leave it to your series?

Thanks,
Kyuwon Cho
