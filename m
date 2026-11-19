Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795072788;
	b=jKg8hxwL2bVB01LUIIsVWkes0KVtaZvGz/I7NQXuauOZC1eKvxanvH53OH2edatCTIcU
	 HN0AUVSInfxaP/pd3XrrCE5Er898pW8ro6tu8k5AQKve0Z76Hv/lOAW5RjIhEEWdsOc0s
	 FPbvHcwFEg6oBRthHwR+xB9OoQMXT42Qkgzw+2DfY5qZdfCjV3BLRtOLqfEB3oSwjyzSg
	 T6LBh6ObC12yOjomU8QN47lLzjqGeNATa8KmfsZg9oDXP7VAZyhrUl8aDjPquGMIfmjla
	 pewMBAGRKs9oidogJukKL5Thkpeql2GFWagJeLBQPxgVLfwj4pi38J9xoKa+Rjd7OPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795072788;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=c8wAnZldY5FUY0sprVy/xqqUfivovrY8S/BAsHx9zHI=;
	b=SOV1Z3qQ63AHaCtgBfzV5R9e4U2ZvzUiJksXWCDfTqTCnOCK1ZFfR8XQPeNj6zrl3gyN
	 vEaRAioDqFgpIGzkDRXUBjCG+YqXB3ai96s6V9PCBudQsTyjgWw3QRDJ1J9Qy08/YlCSc
	 C5z0hepvQApWF2HXqPthXDuKaCN08jdeDtaukLo9o8Bp+uA++FYSvCTH0aM6WBOXRccYO
	 Ke6WsXVebBzb2o0eYER6Ckpw89wOovrz3SWoL3iw6M0FmiiJxwTM6oFHlw0XV/sQzO3Dh
	 1Wc0Nm0mE6+ntUoAYZGSwhECmV4selpKsyI67JdoN0FgBnw6/W81fL6bqwVicBIAuRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WdJgb9pe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32FF606A338;
	Thu, 19 Nov 2026 07:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E32FF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=WdJgb9pe
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::109])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A74D0201868;
	Thu, 19 Nov 2026 08:19:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795072784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c8wAnZldY5FUY0sprVy/xqqUfivovrY8S/BAsHx9zHI=;
	b=WdJgb9pe5emjlqXba6NUt0kYa3jsMKAsa7V0XsZYFVNTSYKNShs9UNoUVz4F9o8q0vTNv2
	BmU+NuVfXh7g+etw/9uw4XAditv6xDp5KtucCnJrb+gel+a+qxjRnx5kMuBj48LvnswkmI
	gZbmdTJVhEKapAnv7j1VzGYohmAwVipbxLWG0ELIoWQp31YLjwp8Mt3gIZ99CWJxMBNEh7
	p9dz0eITYR6YCHOCpbF3OZ0eOKYwiXahZFvFPablweGlZ5731Jh37wiDyOCh7eiCsNwRZp
	+XxCURmL7DQH2Cx49kn5wKxCHATxmSl2QZsI5POI9Gr+Dv1S7uxyCOM2vmH9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795072784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c8wAnZldY5FUY0sprVy/xqqUfivovrY8S/BAsHx9zHI=;
	b=bAmx4j9t2rTXKphViZ/vLV9aKS4Py4bl0KhqVMqIpG+OmkByPjQwORzyiv27xSX5qNn4mF
	xByXyxiwWB+se1khSkiMt+kqWhJ0U5grOJztntY7AInqQ6286UocIwc1xm67gkDOS0X00V
	zYmfk4YirQrDFpRQdb+LIFK8OaWR7T/5f6q8rC8BLCU9eXXroIX13lHmZqtT86hFPW4KBA
	ryGkVxjeKUomf1eARJMvWxsUJ5e15DfL402Vw6oWyJqy6P9ZAPu0Adpjmdo7hDvYCUdgtW
	vcB1NmAdmSsFrvgoaGMs1t7GysrKElpO/IJ98KDOZ8P6xktIcoLzTA9sS4LUuQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795072784; a=rsa-sha256;
	cv=none;
	b=c9ZyJPMeNN2bNw+qK3+NlqQG92SJWUohNn9v+ELUh7B7Ui+h3c52rcHv7WQ7lHL2g6SqeH
	qk5exmDY9zWakI9Q0YkN+L4H4WDUzSlcos6gqWggzJZ5P79AltdFE0n6Us2pSWnMJGql45
	1QDiPfObcXd9Rzi/mCj5fzv4sUEqJfBMy/DKeNkGa3l3akFua3v1VHovBZ+n+n6Wu5CSQT
	wvZZQrzdcE3kFjnV6ofHglDXWsNGVaIkFy8khw2YBy+/HpG9H9cKB1d6CLRXRajb+lsNnB
	IIBTlHrup2OX+hEL5/vY3m+AsA+jSnsaGW+VWkaULSToBWPmNw+015D8b6ZwOA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id 894991BF6DB; Thu, 19 Nov 2026 08:19:44 +0100 (CET)
Date: Thu, 19 Nov 2026 08:19:44 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
	olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	arun.ramadoss@microchip.com, jiri@resnulli.us, linusw@kernel.org,
	f.fainelli@gmail.com, vivien.didelot@gmail.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, jensemil.schulzostergaard@microchip.com
Subject: Re: [PATCH net-next v3 1/3] net: dsa: microchip: ksz9477: apply a
 shorter ageing time at once
Message-ID: <av6jEDrNaCwejcft@pengutronix.de>
References: <20261117-ksz-stp-ageing-v3-1-135de6b9f8ad@pengutronix.de>
 <179505020064.3136.4475163541276513628@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179505020064.3136.4475163541276513628@kernel.org>

On Thu, Nov 19, 2026 at 01:03:20AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Is a fixed 2 ms pulse enough on every chip in this family and for every
> stored Age Count?

I do not know. I tested only on a KSZ9893. 2 ms worked there, and I
did not try other lengths. The datasheet only says that the bit
enables fast aging. It gives no pulse length and does not say what the
bit removes. The
800 us figure in ksz8.c is for the KSZ8995XA. I have no such figure for
the KSZ9477 family.

I tested Age Counts 2 and 4. I write Age Count x Age Period, so
2 x 150 s is Age Count 2 and Age Period 150 s.

- From 2 x 150 s to 2 x 5 s, I read the FDB after the pulse. The
  entries were gone within 2 s. On an earlier build with the same
  code, an entry learned about 2 s after the change aged out after 5
  to 10 s, so the new period applied at once.
- From 4 x 75 s to 4 x 2 s, in the kernel STP tests, a monitor read the
  entries of lan1 every 1 to 3 s. The entries of stations that had
  stopped sending were gone at the first read after the change. That
  run used an earlier version of this patch with the same pulse code.

The tests do not show how the pulse works. It may remove all dynamic
entries at once. Or it may run a fast ageing pass, and entries with a
higher Age Count could survive it. I did not test Age Counts 5 to 7.
The driver does not check that the entries are gone after the pulse.

Starting from the reset value of 4 x 75 s, the driver picks Age Count
5 or more only for ageing times above 1020 s. I keep 2 ms for now. If
someone can test a higher Age Count on another chip of the family, I
can extend the pulse or check the table.

> Can an ageing time change in one bridge now flush the dynamic FDB entries
> of every other bridge on the same switch?

Yes. On the KSZ9893 the pulse removed the entries of both user ports.
Fast Aging, the Age Count and the Age Period are switch-wide, and
.set_ageing_time() gets no port or bridge argument. So the pulse also
hits other bridges on the switch. The commit message and the comment
say that the pulse removes the entries of all ports. They do not name
other bridges. IMO the cost is acceptable, see the next answer.

> For example, 300 s (4 x 75) -> 30 s pulses. Going back to 300 s
> (2 x 150) does not. The next TC (30 s = 2 x 15) pulses again, so every
> TC on/off cycle causes one switch-wide flush.

Yes. There is no rate limit. The pulse comes only when the programmed
ageing time or the Age Count gets smaller.

The cost is unicast flooding until the switch learns the addresses
again. The switch learns an address from the next frame that the
station sends through it.

The pulse also helps after a station moved. Without it, traffic to
that station goes to the old port and is lost until the station sends
a frame through the switch or the stale entry ages out. In my
worst-case test without this series, one-way UDP with static ARP
stopped for up to 56 s, 43 s of that after STP had converged. Such
fully one-way traffic is rare. Once its entry ages out, the switch
floods that traffic anyway.

On a topology change, kernel STP only shortens the ageing time. With the
pulse, the switch also removes the entries, as RSTP does. For RSTP and
MSTP, IEEE 802.1Q-2022, 13.19, NOTE 2 lets a bridge remove all Dynamic
Filtering Entries, not only those of the given ports: "This does not
result in incorrect operation, but will result in more flooding of
frames with unknown destination addresses." The note speaks of a single
bridge, not of several bridges on one switch. For other bridges on the
switch, I think the cost is the same: extra flooding.

> A CAP_NET_ADMIN holder in another netns that owns a bridged switch port
> could toggle IFLA_BR_AGEING_TIME.

Without this patch, that user can already lower the ageing time of the
whole switch. With this patch, that user can also cause a flush. A
flush happens when the programmed ageing time or the Age Count gets
smaller. It can also happen on a raise, for example from 8 s (2 x 4)
to 31 s (1 x 31). It also happens when a port joins a bridge with a
shorter ageing time than the switch has now. Other bridges then flood
unicast until they learn the addresses again.

Oleksij
