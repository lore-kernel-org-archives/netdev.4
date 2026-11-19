Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082531;
	b=FkZz+t93MnTbRdq08kCmcgQn6Dp9bvhrMLja2b3EJc5lsTqNlclGVGAmA89yTWXloQct
	 FszJyoicKQ2mt2H2FvIuldCl+oKOVZM/T6MVBZz5hZCZsPb4tvhoiFtxqEDdAQZ+cLUxh
	 E+pYT6ngGxPqSN84DPkdsVhT3msKbb79JhG9Hd3eaVw+FfXFMbqGRMgIQUYJUndCjiui/
	 1hJ6L0ZoWwSjXXuRTUkl3pwNhODI/GFJ3HGKtsuPNYKq0atbYmzzuni2eHVMAzyBvhc0l
	 YbDKBPaLjgpvjYrbMNsVIDIf9eR7n5RxYd6QmaRbTFFVMbB92OTop0DjyWkG0BdnK/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082531;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5NRrnpPRoICcPwb9emd9JPNK8fUgBNANt3iXcgswqGE=;
	b=laVl0+QQTZZeaatee/g1PEb3vm1lwfK8rzZ6oqFflxX2h8UlDJfahcUOlxMoeJa11VLI
	 5d9tOD/xFJ6hTtNgOZIJkNiXIt5/EVhwJGBRfFICldpEA62vI/+s4tJWFNesJUPzxcnx6
	 qnF27qN4SDbP1SbrbjX18i33DGSJ2OWZuKn+Ej0+w+XVRgK6TY09ybtMIt3T6WL19WJjB
	 ZrSxY5ORIilItAAxK7diPjrYP04gRakZJIaUlhc0x314kBE13cyV7iAXSksubu1rGflsU
	 fS46WlAuA2PDIFnhSkt2HdZwj0a8ZGeAy2J+g2DXNCPLj/Tos166GVwmBs1HI8JNxlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n1w2Palq;
	arc=none smtp.remote-ip=91.218.175.63
Received: from mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C993606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C993606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=n1w2Palq
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5NRrnpPRoICcPwb9emd9JPNK8fUgBNANt3iXcgswqGE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795082527; v=1; x=1795687327;
 b=n1w2Palqw51RIj4ehrFUd0RyrRqxG7itpKZ+ojpJd62beyv52H47ocwl0hbORQz5Ni3vIZq4
 LkGE1mf8BetPpirytgvOval7CtQHO1WCglMOfhiOuCQxcVuga+MRk3Av/O3D31MljQvK4NSnbfN
 kD021myx9h8eJOb8iTPV4zd8=
X-Envelope-To: netdev@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8e2188403d20b602;
	Thu, 19 Nov 2026 10:02:07 +0000
X-Mizu-Trace-ID: 8e2188403d20b602
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 18:01:55 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
Message-ID: <av7JE91kbL3gf8MS@fedora>
References: <179505868590.3571070.12381528230330714812@gmail.com>
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
In-Reply-To: <179505868590.3571070.12381528230330714812@gmail.com>

On Wed, Nov 18, 2026 at 07:31:10PM -0800, Kyuwon Cho wrote:
> Commit c84fcb79e5db ("bonding: limit BOND_MODE_8023AD to Ethernet
> devices") rejects a non-Ethernet first slave in 802.3ad mode, but only
> when enslaving it changes the bond's type. A bond keeps the type of its
> last slave after that slave is released, so a bond that once had an
> ARPHRD_TUNNEL6 slave can be set to 802.3ad and take another TUNNEL6

Hmm, should we also check and set the bond device type back to Ethernet
when set mode to 8023AD?

Thanks
Hangbin
