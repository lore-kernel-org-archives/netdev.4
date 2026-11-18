Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016248;
	b=20Pn6sl+O2sYg9WAtjOqffDKqWLNdsLlTtDvZ1S3JL9pqr4im673nzSSKNRMkBXtx30R
	 HEazQPGCnjgyxf8fOiMY0aKvkfKINbcF3w5sIx9qdzBSWnLNsGQS3koNDMJT9v1HJeeH1
	 +XSY4h2jK+nY6N4BDUsEzQV274idtjFQEniYOim5bg+og3PfvWCW1VA0i0Bvs2fDszTmP
	 piUAB0h/KSeWHJbRcwbqv0UYWvLRl4J28gSDMzMx7girkwWTQOhC3raJ7FrKsRW0WzWoi
	 h2kM9KsHl8DSMXafSnGYKnpUNBAMfgRAJ3zCZlW7WhXDVkLA6bGmTRIMvsNTFU29xTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016248;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:X-ThreadId:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=6n+tPNJje4mmlPDBUj+N8ky7oVmIq2+HkMsAcLGALoo=;
	b=UmxVnOYkUulPq9rTYQCmSpGKp2F0ygH6HMG54KHLSTPWjaai69+Vy63jbvUHWOv8tLlP
	 jItQBmJF3s+Ut4fPj5OVgLkcwxqJArrhtG6IYyDWNsPClZhF6wZE60YraAdlqVl1G8sE6
	 FazGtAsGRjsYsnHh7Suk+N+51DdRABc9Qnkt8R79HMxaNjirlIh8Gk2+OuCAJ3tiFn8Ki
	 osHRpdGJ0iPgROL02wNBfP+4VetJQX5apE7n/z6DvVnFeUepVOY1HGaNDdrV2eRsZQFRe
	 kH7G0chc1vsvI+x2ZVLxd/3dEOGWAM5UtHVN5ZULj9PS7XrEw5cy7aduZPHlzxnH6EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8ZlQUdz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69A0606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m8ZlQUdz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46A1D1F000C4;
	Wed, 18 Nov 2026 15:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795016248;
	bh=6n+tPNJje4mmlPDBUj+N8ky7oVmIq2+HkMsAcLGALoo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=m8ZlQUdzHxMWfWllzJV9rwXynwIWVJ5ViSrSgbyyAEOmcvcnXe5EeecTcHDMXdBg8
	 EMXkA+P0ioTcZv+k4R5xNg6KaE3KeoGtHmIRLRIOECXG+nNf9IftChWQVNw45oXvLR
	 l+VweFUZcfLuvbd0cNuYnZtTSYstaXNT4yAzBDro05DG5fxeoGjgabW3B3+hdN5i8Q
	 wMd4uZdN4Imc+u/tkofU1Rz0UxTy/HGkVsN0GbjbXoUGfdMV8IkiMoKGazBJKFyswK
	 6VeF9AF1uV1Lyz+enk++76sfHE9spVI3kXbMVP9kVSNr+wgt17mVOIFZktSbor0Xw+
	 fmkiUD8ZXnYvA==
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfauth.stl.internal (Postfix) with ESMTP id 9D65D780043;
	Wed, 18 Nov 2026 10:37:27 -0500 (EST)
Received: from stl-imap-13 ([10.204.2.104])
  by stl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 10:37:27 -0500
X-ME-Sender: <xms:N8b9ajX6fvJtyR5jLevDNtOJX1-LB1xMLhklkgGsV14X3diYEwY1_w>
    <xme:N8b9amb6Rs8_fyB-Sy3CTnC2cDWtiZh9yYGfvvFUs_cNTdl4FUZ23RgRCbMCoWBGc
    YTOUJ7dVL0yuW2dx4n-u9F_cACPwOzEVyD-F_333rOUOEfL-Pp4Tnyb>
X-ME-Proxy-Cause: dmFkZTE14r26dehlwggm/qu3yGkhybPXesOZMuXM2o2pYWoDTKz3MSOHznnQTRYWAKabOq
    4c9z4xgPTbvp9PXjwuXSVgfzsqhfA2I705h7SyW/ecvoJ0DG/WIy+YyCs7k2Z3lO0dySvs
    zVxLqg7GyTkURAC2OG9nudbow8vdQ3PV6iK6W+zq75SWoPS925mVspAfStid+kpMrGjgNg
    o7zWhW073G+RLTXZfT+hp7ANngqeAmLBUFzpB2z+8yIbNO4QW4el8fBUZg1ppbQvcIHMA2
    3Bzv0rs6xkE/fFW3tdvP3Jlxka8AuogMXB96ZA0c054Cq57U7vn0ZRn5aHDwTnOtddQ8it
    5qnrkC2Pvy/ufs0t/6LAs9RAg/UBShTj/BSYOeduF3SiVRc4gwDfWsWrnTnuNYQGPxSh7N
    BGM8/5gw5a3StdskhOses2/lZGCHzAvwooxeVYj2aQQ7W0PtUQvScKOTKTxAqbSB4IXhhe
    hrX8gJ3o50SaGSpL95GSvXgeeYnQtd3RQ0VYCAuwFZlOEhiMUDGTzg2kvd4/HCK+FlzZos
    Yqq758mzoi8a1PMMqMoEUjIj561WF1N3w4x5p7SXt6TmY0lFxDlRpg+W58mK6dZKe9aTYK
    mGZI8/eNysSyQ+M9FeZZC6Os4kUUmCG/oMwHNqRpN/GS5YmpdcsWd/h4aeug
X-ME-Proxy: <xmx:N8b9auBTxV4MlEo77h5aVohweyEU1-EydjOkdXXBesKR7IGjtZyExw>
    <xmx:N8b9amx8WJgtzAwWcuXu3oBnzHs3kXQe2U7FWwLQf1nJi-NbPV75Gg>
    <xmx:N8b9aq5FVLAeBIzQ-QfMn0O3xFph60pVTlVRJwT8bE2XMnA2QN8uTw>
    <xmx:N8b9avzRyOHqEScYzpPUY7jmn5i1Cm1CmRTSAfvhElGlXa0tivkF7Q>
    <xmx:N8b9amfrRHuLdfTSP4lcZHdN6WO4-wkCaaJxxRsVlgZiphExnExexm0N>
Feedback-ID: iccae4b50:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id 3BD57F60084; Wed, 18 Nov 2026 10:37:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 10:37:06 -0500
From: "Chris Mason" <mason@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: edumazet@kernel.org, ncardwell@google.com, kuniyu@google.com,
 davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 willemb@google.com, josef@toxicpanda.com, netdev@vger.kernel.org
Message-Id: <cc2474d8-9322-4448-91f4-fabcf203b2a8@slotsi13m47>
X-ThreadId: Agcs-HsVov9o
In-Reply-To: <179501552309.3136.7905606885338776327@kernel.org>
References: <20261118005048.53393-2-mason@kernel.org>
 <179501552309.3136.7905606885338776327@kernel.org>
Subject: Re: [PATCH net 1/3] tcp: don't let __tcp_set_rto() return 0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 18 Nov 2026 15:25:23 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> This floor only covers callers of __tcp_set_rto(). Can
> tcp_init_metrics() still store an icsk_rto of 0?

Yes, both ways you describe. v2 adds a patch that clamps a locked rto_min
to the range from one jiffy to TCP_RTO_MAX in tcp_rto_min(). That covers
tcp_init_metrics(), and also the rto_min near 4294 s that you mention for
the sum in __tcp_set_rto().

> After that, the rto_min == 0 case is the only
> trigger left that this patch is needed for. Could the commit message name
> it, so that stable backporters can see why this patch is still needed?

Eric asked for the same thing. The v2 changelog describes that case, with
the Fixes: tag he suggested.

The High finding on patch 3 is right too: tcp_rcv_rtt_measure() still gets
to the sample << 3. Eric caught that one as well, and v2 clamps the sample
in tcp_rcv_rtt_update().

I'm leaving the rto_min that is raised in the middle of a connection alone.
It has always worked that way, and it isn't what this series is about.

pw-bot: cr

-chris
