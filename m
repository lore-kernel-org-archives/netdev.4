Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518201;
	b=hyGPDeSVVFoPgjqUessH/K33zSrvaOIwvZcOR7dYGoKyelblle0t0zJNCtTotgsSHWhP
	 JXs67PIkgG+f+HYoOSoS9HLsdvS0b6kS8MVLKgmOsFqhJEsPGAj6fv6eh0AFmMHEULBhT
	 Z1RoHtrUiK5kCcmphIgfvalI8Q68dghZgTof6IbLJsR51nZuPjlJsmWGkmDW0x+ny6KRS
	 uhK0rlgRYlUt4rxbTeAcPmHCFKzrgmK5VmGmLTRJ6ku0fDOnaU1eyx9nuYVoCrP0YCC/R
	 1zPTtF7yPBMLXp5Va5G6dpLIUf3J7HPiizjfSFJiMTsYJB/8Hfwxu2JQe+MHUqRJy+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518201;
	h=DMARC-Filter:Received:Received:DKIM-Signature:X-ME-Sender:
	 X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fb4GPvrA4PbNAewtrFTSzH2Q1ZRZYpVzwZ34/WXwwdQ=;
	b=IutTuWLZe9L5EaRrLu+1jNxlY8VXxqR30EOjvDuLBC98KPsczmetYIyDiFKzMGIRTy7p
	 xdV3fQKrbCO26ZAaKbfu1nUHAkN4YyfUkpdgBa3Re5CdCjv4G5rYTy4SUVvdsdcV4F7CY
	 pKz3ILCidwKrmwAX6Mk9kO/n5xOy1wMiHKOxqeB+iIINYgiTRpD1KPORfwO8qffo1XJb6
	 shk9oai/mj7o36vHMSmO29/Sou7+CuEMTdHc8JWFVTJ1/wISVW8rgbVX0oBMMuLrhwhTE
	 sxeRkrRrw4bY3ZBVoHDY9ax+uzIP6AXnIsNaaJO4UpY1uFPogdntaoqm4qLK82ZviUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=idosch.org;
	spf=none smtp.mailfrom=idosch.org;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JOHXbO7d;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8E1606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8E1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=idosch.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=idosch.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JOHXbO7d
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 24491140021F;
	Tue, 24 Nov 2026 06:03:20 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 24 Nov 2026 06:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795518200; x=1795604600; bh=fb4GPvrA4PbNAewtrFTSzH2Q1ZRZYpVzwZ3
	4/WXwwdQ=; b=JOHXbO7dAYytPA+JXKQ8XmVfpV/1OVgOrdqD+El6SzJ9VxE4JbU
	15WNE9zFF2dX4rHJocRlxRi/knFmkG9tISd/RJZXvmhTJp3vn+St4hkSM+yu/l4x
	kxg4MTs0E+9fooXr0reWAronIHTWXRxanA+DBFbmVKLLa4DqXLQGcqchT0FMTUZh
	nakvdIie9oA5rgvPgm570JF1ajUlnWK6fy/Ad6cWY4FGncxdLau1csFSgQrdYwef
	eF08H1lS533yTWXtDnL8mT5EcjISMoi+jq8d1Ed/sbtmddJw6JS6T7Vs5nIlA0gb
	dA4OujqJdhhnLUVcj7ANi+c+QKe0wGg6fvQ==
X-ME-Sender: <xms:924Fa_sHgmtvQtToc8Xq_yyo_WLZM7MPBCwv_vmgK3yWGA8M_6wgFQ>
    <xme:924Fa3XOGbo4cbS5417XJ0GV2wXv8_nOFeZVcryQCIdAP9M2bHLCePe8ILRR-bpRM
    Ns_2JZWfun_CaTVwuUzQG7ru3tLXk_PmgNd5fArTsLbMmftiAI8>
X-ME-Received: <xmr:924Fa7GYaNn8g1lR0ePpaEjhCpkJAaaaFhN0jcv7j5J5ltbYhqagfoTe>
X-ME-Proxy-Cause: dmFkZTGCD2LJ/DttXMMlaBnMbMa4H9ulDozBKkIjkPOUTXnnGPFHEspN9aScfgNATBHquA
    RVJyKwUO2YWh85HOav1sw7NVq+3Ypa4jFTcjORiZi4mpyUSwxJAXuegoJe/eyhcv4Loo8g
    DlUsjABctmPwIdWOyLlzIfFCmRxo54ymKmqdRprpUMymM80FZFLtJBgX4HhdL2dN45kwJN
    tL6ni2W8u/CvkcGOlX7b200vzepy50HAeuOuTsHkLRANWpzu0Nn58DVxbu0lhLu/ouAdmx
    tA9KJ4cTbPUfQDgBIty8ryBM9ogcR2mKOv3K+1RNmv3gP80pqcM5btM5icgH8qTr0AzTOx
    OJsvecMNMw0hRgE2TQOTaw/ZCPIgyeIiLjxWGIla9ZwY9cc2iX2XkFSDhWyGN8jbxsNzOu
    fOAMHLLMgqkkrkzXoTrehl4DqQsbS+Ong+LSqNlxPr3GO6YO6T8ZimnDylbery1L6Fs+7y
    qYlIoDq4IaU4PDpVdmRxDcpnI5pMKjpwXmeE8R4rYGVS+HyBKIDvIF8B0NTIVsmDg1gpbE
    i6UI3yw9cONa99wbDcmFZiL9+srIlMlOsBjqssd8pwh/i+TFfxEFkDtR2rKR75kznyOh2E
    6mP/qoTBpiu82PyH8hybY6GAx+f4K2PjtR6bftAECUfslSXKsk4JK08gUa/A
X-ME-Proxy: <xmx:924Fa50zhVFzuXMRnKSr7fdb8jfe9YkhRFuSROIOJuTRA4YfmvOInQ>
    <xmx:924Fa9PE51Hcy-Uf6RkENNHgqWA2t5m6-3MXXxzo2ZOkU4a2XdRszg>
    <xmx:924Fa465BIsbjSwPydn1vY7w5-_cRvZeOGtWdyi4RfBFA-I2riop5Q>
    <xmx:924Fa33d2fhNMXTXOhhGZVs7eP0rvU6FziKqSgpnBDGead0sKQvPow>
    <xmx:-G4Fa1Y1LguMz4UvQKx7J2Kq1jm6-sVQgajH9VA1zDbmwlLdOXumg-5F>
Feedback-ID: i494840e7:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 06:03:19 -0500 (EST)
Date: Tue, 24 Nov 2026 13:03:17 +0200
From: Ido Schimmel <idosch@idosch.org>
To: Nikolay Borisov <nik.borisov@suse.com>
Cc: davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] ipv4: fib_rules: Switch to using a for loop in
 fib_empty_table
Message-ID: <20261124110317.GA3761951@shredder>
References: <20261120081242.318541-1-nik.borisov@suse.com>
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
In-Reply-To: <20261120081242.318541-1-nik.borisov@suse.com>

On Fri, Nov 20, 2026 at 10:12:42AM +0200, Nikolay Borisov wrote:
> Since commit efdfb1e27a33 ("ipv4: fib: bound automatic table ID allocation")
> added a sane bound to the loop looking for a table id the concerns in
> 58075ff523af ("ipv4: fib_rules: Fix possible infinite loop in fib_empty_table")
> are rendered moot. Just revert the code back to a "for" loop, using the
> new bound. This makes the code's flow and terminating condition a
> lot clearer.

I disagree with "a lot clearer". The function is tiny.

Please read:

https://docs.kernel.org/next/process/maintainer-netdev.html#clean-up-patches
