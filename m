Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795775467;
	b=VFxP23NFhwLwzs8yddUPLqhYvf+7m0Mxw1FGcxlpPuYML01vjv/FiLq3WoEGIW6kU/y6
	 AV/kjTbw2UEYM7PKhJPPifnssrhzLQyNXi8BHavOvymajkmFjVYv6bAwEf5uYODFmBIYc
	 /8FuARSrrP9WZi/6U/gA5jnnXYchuxAr97JXahqj+tJzAik/+N40s35UlNj91CdHWd81m
	 V0Q5gc8q46xln+9WfvIR4GFIJxvnWZN4jcRtFD+oKBUsertphtnh7Ny1GdhxBlkBad9SO
	 3rfPSsPD9R8yrbGmWgQ5jmgWN/WslGBwl3Dms+QHV9Jak/72aiYufnx02a8zk/2tY+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795775467;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XSCnyjLpsNvMtm+31p2bka0WG167fePkkbPZ35qlx3o=;
	b=LgJciKQARZx1B6LEp/Y5L8qD74GwfS4QtuB+pY6Kw/n6lyDwYQ879YPpxYX862X/h7oE
	 JU8Xp8abxppU/FVkJJ4Gf/0eTBWGnX78ukwS0ydcdzINFKzX9MBR+5JGnM+MYTF6fg5Lj
	 TEeUP5ps5I46jfbqgZUG84odFs+bhRStxm/mhiFGJPcN/HzBF2528vTOedgXAEwgB+zC7
	 l39dd6hwuMyIu7DvFrhD8ysAb42NBtqYEWRe+xHmZU577RWbLmFlwH30joQNKakcvOG06
	 CWwH1+SPONGh9LS6izjm+rcfeCpZQAsnuuu0JZ/GDQP7xsGeDkEJLkNcd+VwBLFfKkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G+moObp7;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zh0XhEgi;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3261C606A324
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3261C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=G+moObp7;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Zh0XhEgi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795775466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSCnyjLpsNvMtm+31p2bka0WG167fePkkbPZ35qlx3o=;
	b=G+moObp7SHS1ern2/Vb2hF9kCNvQh9U+JTjypns6GY6c9kJ2e5IwuqPLPqWWKkeDxhNaK1
	N5B4BYQUMEB94A3rH3p666veQwVEaX+GlsolZUo6croiVG6TzEwGzlbQq3PxaWcwhWuX1m
	nTsjz07QCPXrYKsNOuIzcyezwhDrYEk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-EaeRvnvgP4uUpIzcWlbbaQ-1; Fri, 27 Nov 2026 10:31:04 +0000
X-MC-Unique: EaeRvnvgP4uUpIzcWlbbaQ-1
X-Mimecast-MFC-AGG-ID: EaeRvnvgP4uUpIzcWlbbaQ_1795775463
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a1f03f2e8aso69155305e9.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795775463; x=1796380263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XSCnyjLpsNvMtm+31p2bka0WG167fePkkbPZ35qlx3o=;
        b=Zh0XhEgiFUksAQrcxCAN70XvJr2Ip5PP/9wvqVKd5gErsUgpmAxvswcNkpzL9OUmR/
         1l1TikACsT9GsKAQLV2HJ4WVeJi7bD3vSriQUXmBo/6k2is4z0szOsJLkT+FDxnJ/hKb
         P7thKrRhcXBXzMWEXd5NfC9TXyPK0xldPleAChd9QluUEaRwit642BYVfniSkJVL2FVl
         1DG1QbJ3DbjU/qcgk+G18WTSEoiAvPZgnwkdfGJcks6sI3N1BtgyBRh7gq3SMkYLGCkV
         Y5LmBEhVcvxhxvnZ7PSVmUxyauRnaNJ+GBcCdecUMqQxWlBI2z23ZVQRsjxV9LFVtkUW
         0L2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795775463; x=1796380263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSCnyjLpsNvMtm+31p2bka0WG167fePkkbPZ35qlx3o=;
        b=lbSX1hNa2HvoS5sERGMkH09Fl5Eybqg4XLX82oc1lJxW4od+00mJCt+De9tV04X1Y3
         913x/ghyrHyhjjckIGAodV40TZHwgeZ3ec7dDBr/rEMMXjNPF93a1RbWKgr11XbtFtiw
         FVDmCHlQAMio6E0R/WW5hXMfUVo4zEk5ok97IMm0WBvKPalv84x9z8TdgJmaWWZpA0uQ
         B8h9KdIUoJOsZVXzYYGSrezgV6LsiUbICVoCBOhxaERo8BtYJbDQYPPOlPZoxG/wYIt2
         OqZvzLACbdT/NOPc5Qbb6NlMZlgcqqPO5FGx9ryPIZUGMUGb8zzNHTU5+IsyUUgFSm2B
         vFWg==
X-Forwarded-Encrypted: i=1; AL+hErGZliWbluMiKTS0yeAvZatcBA0bcd85xNXQji38HHbhHq6vC5tOvxNshR7a2CHVnN+XXvkMCDM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lsL1hapFuzRioGVz2X1CcMNf1EwofZtJ52RsWBOGX4xWMplZk
	vO34/PmrGOsOGSMMBHpu+mXOmXyHZSBTjy9tvSOz+nGE7vQmtgjrHhk2Y+yD2dpCev7JHBujl7W
	oG4j8Gl1mLpCs4hC/uQXjWR0ltKEHh1vpbqVRw/kzopO9zLhudcTWvFqPTw==
X-Gm-Gg: AZFdTZfLGsV2WfVHxnYNKpU3qCjgBbabFlsC68H4m7Zb7GBAHgYyDiuaGj+6/5lWFf7
	Dxwd6s3bSnVIT/2up107rDPGXSXb2rlKXIhu9i/Xv6kEps/fDOrV09+5nwN3Iulm88NbGN7/Ufs
	y4pXgWFFDf9QE0CdgTfWXMJ+dsyN8/urpF8uOKa1N1PwhRNm8d4s3TLFbd7kdv8fNvuff8T9MDv
	h3XqhQxIyOapxiofbUO42aVQnBV9Ejfmj3luShfADrTsbNyel7Gw3TbmksRqtLWereC7stcX67T
	EXxcpZZ6YGPYZhJ/jUneaV+awfngfYd8ThzDupTdeB8vP62/y7sRDGQeNUZf2Kd9WsgxxwEBqKk
	xGYFpBRAUdr/P7NYLbcvgy8QOY7d9UDOefyOQ28CTd2VlW2E8tjgTfax9mzWIOsCEb6xvlDGR4l
	xEXLujsyV41ly0CHDGchedQeA9p4RnIBJVkyLZbve73apB
X-Received: by 2002:a05:600c:4f07:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb88804d58mr564045535e9.9.1795775463406;
        Fri, 27 Nov 2026 02:31:03 -0800 (PST)
X-Received: by 2002:a05:600c:4f07:b0:4bb:5dbf:af06 with SMTP id 5b1f17b1804b1-4bb88804d58mr564045115e9.9.1795775462961;
        Fri, 27 Nov 2026 02:31:02 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm327115695e9.3.2026.11.27.02.31.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 02:31:02 -0800 (PST)
Message-ID: <3fcdde4b-b42b-4ca0-bbc2-c5be064847ee@redhat.com>
Date: Fri, 27 Nov 2026 11:31:00 +0100
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
Subject: Re: [PATCH net] net: lan966x: fix disabling timestamping without PTP
 traps
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Horatiu Vultur <horatiu.vultur@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org
References: <20261123-lan966x-ptp-del-trap-v1-1-3f46ca6072b2@microchip.com>
 <16d457c9-ff01-4ecb-9b50-1daa2be6a255@redhat.com>
 <20261127094536.xejnqlz54ynmhyhy@DEN-DL-M70577.microsemi.net>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261127094536.xejnqlz54ynmhyhy@DEN-DL-M70577.microsemi.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/26 10:45, Daniel Machon wrote:
>> On 11/23/26 15:53, Daniel Machon wrote:
>>> lan966x_ptp_del_trap() looks up a PTP trap rule with vcap_get_rule() and
>>> removes the port from it, or deletes the rule when no other port needs
>>> it. The traps are removed whenever timestamping is configured with
>>> HWTSTAMP_FILTER_NONE.
>>>
>>> Before this patch, every vcap_get_rule() error is returned as -EEXIST,
>>> including the -ENOENT for a trap rule that does not exist, so disabling
>>> timestamping on a port that has no traps installed fails. This breaks
>>> moving the hardware timestamp provider of a port from its PHY to the
>>> MAC.
>>>
>>> Return 0 for -ENOENT, as there is nothing to remove. Pass any other
>>> error from vcap_get_rule() on, as the rule may still be installed with
>>> this port in its ingress port mask.
>>>
>>> Triggered during test development, without kernel modifications, on a
>>> lan9668 board whose LAN8814 PHYs are the default timestamp provider:
>>> "ethtool --set-hwtimestamp-cfg <port> index <switch PHC> qualifier
>>> precise" failed with "File exists". With the fix the same command moves
>>> the provider to the MAC.
>>>
>>> Fixes: 72df3489fb10 ("net: lan966x: Add ptp trap rules")
>>> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
>> IMHO this is borderline for net at this point of the cycle. Any strong
>> objection to move this one to net-next?
> 
> net-next is fine. Does that require a repost without a fixes tag, or can you
> apply it directly as-is?
No repost needed, thanks!

Paolo

