Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032590;
	b=CtNAdF8WpMlYlNEl9hmprVmwfBkV3YkeWrE/a5j/DS5hMFbZu5mAx3+AXL3qKaENJSTb
	 LdMpe5E+NZ+FWSiRSkAuGwv4Inka8TGfZ8YgIgafDPbdTdzslpwmkr/6mkGHuSkz0OHRC
	 24DfW+Rn1btXLvTxjm/ZuMBlD34FRz4uYsRba5ys4ep2zA0JFdIZ+eVrqBPP385dnG17f
	 44Xn5XgWv0SXFDurIFjm7QeMfvZYP/efuGwwztjXaIcpYE6lQ2n0TewMeCV0pF/6WapxC
	 9Tcha13FC2EaNI7k7eKEJpsI84t6PYNyIncjz8NoGeJ2PhiRBKAD89vTHH8I4LWvB0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032590;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=SFZF3FV6U5E27LOurOw4lsSFBznHDABG46zAUlEpe8Y=;
	b=BOvfhNdnS+I1+6MMtmng0SohVnbGlpgy7PhAms5DPwsk2YjwtnBoVupwOyuJ+IOrk1vo
	 7TTrcnfgv01tGMwr2azJGo0z+u1Vch6vVqYljQgUNkN1gWRd7Hd3kp2QGuoqZsuWbsLSY
	 mcfBIfNQJFTuAQsB3fMwjVO1THQQlWwEf3cg2ZmB8xnDWOP3jJBY6HkVGMPLtuXkt5SBm
	 A7YEsR1JZrFMbc4sqlipXM+s3Wampx1ngqP0EpvLcF/Ken4yTYjOtcZU/IdeNLTREhrWQ
	 59vI9Z9ve0gMscq2tw74wlgUwHEDhbKE2l1WpKNjZJbZ5au+TKLPTxGrjgdfA4GCCKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=0CcN+Uar;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FFD606A320;
	Wed, 18 Nov 2026 20:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3FFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=0CcN+Uar
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46EDCA157C;
	Wed, 18 Nov 2026 21:09:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1795032586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SFZF3FV6U5E27LOurOw4lsSFBznHDABG46zAUlEpe8Y=;
	b=0CcN+Uargp7HJHCMOUKhmKqUoKxXoZ2gTLtZzx0Gtov2ensxlbYz4glIyu/Ojv7dP1YtyJ
	rW3O+1GyU4EYKsdfjhfF7GoKqQfqFYxt1lFA8JxhAampOwutSxrDIiMpIgGJJFYt3LKH3F
	Er5rRLhlJuMZgsNCbNLzmWvZaMYMmPAVxUCgzfXmcQoXkUGlh7VZsi2uRTbgB3ZmuryKne
	XYOoFzt0WF0VeE3u90HP9W+Lo9rl+cXhL6SfNl6wV6ZKZfX+2IJArpNbr7epeqIYazAVC6
	tMqMp4z+sEyQvJKD26sg1NpNr5V0bAt1RudlnYknhf0j7/Q3kttwRjKLUFm7gQ==
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 21:09:42 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Joseph Steel <recv.jo@gmail.com>, Muhammad
 Nazim Amirul Nazle Asmade <muhammad.nazim.amirul.nazle.asmade@altera.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next] net: stmmac: xgmac: Report the VLAN tag type
 from the descriptor
In-Reply-To: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
References: <20261118162136.2782405-1-maxime.chevallier@bootlin.com>
Message-ID: <a2518e0794b8b9c79a97cb6c768dded6@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Maxime

On 18.11.2026 17:21, Maxime Chevallier wrote:
> Stmmac's double VLAN handling hasn't been working great for a while,
> it's been recently reworked for dwmac4 by Ovidiu Panait. In that work,
> it was found that the tag stripping hardcodes the 8021Q tag type for
> XGMAC while stripping the tag, while the IP actually reports the outer
> tag type in the descriptor.
> 
> The tag type can be one of 6 different values (note inner/outer is
> reversed in the macro names):
> 
>  - XGMAC_ET_LT_VLAN_STAG       single S-tag
>  - XGMAC_ET_LT_VLAN_CTAG       single C-tag
>  - XGMAC_ET_LT_DVLAN_CTAG_CTAG outer C-tag, inner C-tag
>  - XGMAC_ET_LT_DVLAN_STAG_STAG outer S-tag, inner S-tag
>  - XGMAC_ET_LT_DVLAN_CTAG_STAG outer S-tag, inner C-tag
>  - XGMAC_ET_LT_DVLAN_STAG_CTAG outer C-tag, inner S-tag
> 
> Report that tag type through a dedicated desc ops and report it to the
> stack.
> 
> We keep the 8021Q fallback when we don't have the ops, as we don't
> set NETIF_F_HW_VLAN_STAG_FILTER on the cores that don't support that.
> 
> This has been tested on AgileX5 with the vlan.py selftest.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Isn't this a fix too? I mean xgmac advertises STAG_RX but still
reports S-tags as 802.1Q. Then again nobody seems to have hit it
so far, so net-next is probably fine.

Anyway:

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
