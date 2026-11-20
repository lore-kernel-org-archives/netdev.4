Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795219113;
	b=FdLr5+xsdHxXvZ9ZsragVwN1qA+PfpsUC5xoTkM8WjZrGR/7YGT3P9/kAbiI0vUlauFA
	 LsXwEewB8l0aGkGyjh2mBwdvGzu0E0O9A9gGD+fYxLuvYOMHTXnTwkdOGu0E58K+r8uLJ
	 Ds/JBQVAdsFNKc52joCtxSScqWxyMIDthwpDoPgPON8KejZfneRcs16+sJ8FJi4PwKsYO
	 EhX7uHITnr6QlPb2F/FLnsMvXv/3gzVkVSP7oaaQaNqdSdW+Pvbb9t1xptFPDuPN21j+j
	 25pLTO4ppmQtJiluntnN6iC6O+eUEX/jN0qUrX4rEoODikRijacyEp3v613HGyKf9gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=KmNMQ9IxIvqQwV3iGjs6lG5X32Vd3stJXn0kVbcjOZs=;
	b=vAYBH68InPAn6gviHrJg+6IQHy4Gn4F2p1fv1//EiP6Luh+kHVEMaf0XaleIu4xZIxIH
	 uuUWl7RUPZwNynDfk3cAxDb6XrqaQ7tkyBKkkBFMvItX2Cr5khHhb418Cv3Xt3ld24fZn
	 tiyUAMHQaCNVCXFzEHwn0ulVO1Gf1hYF/MEX5n0YuJPRcDJYTkBF09BJig5+bIolDI8tP
	 t0g86BfsNXugJUOyBi43kUKDOrjhCYT2//jzPUQ9HqCX+s52YDzFaYvyNQXON8pbOa6Y6
	 2Ro+AnzpmeGyw1aWTBgBWzSAk9Vi8vgS3QHu7mCPbrUmnaDE2RuTmor+NNu6bNrsRIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdfDHcCL;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC294606A68C
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 23:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC294606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AdfDHcCL
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55bd96affd2so32902901cf.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219111; x=1795823911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmNMQ9IxIvqQwV3iGjs6lG5X32Vd3stJXn0kVbcjOZs=;
        b=AdfDHcCLXpErmZY0qQgeKa8uRMmH5oWEedI7RWQZg0iqa7JSohhVkAzvV2eS5jrOUP
         CrILk0pd8RyZ4qPLM6OMIpqvfhwAld0gEroMJVT7JoKd5LFHMA6gqWEh7RX5jv4eQZv6
         xWVVpKL9GtL1e7Wg/XAqgheAMgyfCROeqBhHQDKVwX6LEpWQ+x7ZZpIb0LP1NW0wr2gO
         I+8u0XnRYdn1pUsbgfLKP2LUF+mxdRZzxPRKgV4yIo8PpI8kuEI6inOzE5Gx4NfWSRkJ
         O6luIjT9sZbbejg0G178KVPkeiygSnC2djTYhE3dkst4j2L8JzoX3hCWhvqbpAfJL1O/
         DCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219111; x=1795823911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmNMQ9IxIvqQwV3iGjs6lG5X32Vd3stJXn0kVbcjOZs=;
        b=BQPEEYPP3AVWjdgfaSYvNHOFzdj8Sz2fd9LLWqfdz2YqMLIUW523OIgd1f9hQoMXmV
         k+axxFR02/JA82FTazdQPI2SloGI1CbXvsP6tWFZxJY2PY7PBYlVdu40ATmVXi2wLw2c
         e4GQEMOwFqyBvFTJ3q/m015Apwk8TZTyB7QPt1NlOUrD5mzcgb6Oi5gEyLhmXnx7bCjE
         s4hklLt1NA/6h+lSsWfWnOscODpicSOwCRsuczoSAHwCRF4aqB5bidNU4LLXZuSFUsh/
         g1duR65LfvOYIc3/j2ah97AsQUVkKxTUA9eigbKcfjKvtHx3irhcP2TRIGBUWypnWII3
         ABHQ==
X-Gm-Message-State: APuU4Z8rumAwm+RIFeO/5xFTsTj0YajRZR4iXTJoMJdNOkxC7JpFRvhE
	0VcxmpJUFykiBnREyTdiCVwuUQeKGa7uu2g5j8W1TyjPfAQz6JeNo+f0
X-Gm-Gg: AYBFou1diqt+5lRW+qXWejWZJ4poBJYh5yaGQmMy/iTMfo8Uw322FWY4HwXSymGp9yB
	SkXp6jjTuKMAFQ90KFkr/GEbp8bQteZugQwaeEf+3GbBUceOlZEh/wprSRJ8X6Iwd+u809jv82M
	RRv+oTqYaRIFkDEQ61DLzFuwv+/tZXYHU7XByze3mnzHHGZDpgzPuT4M3KbYbjpekjIe65IPSLb
	iLT6bZf27TBNDZ4DVlaN/BCAbaM3nymj9mNtzACmDEgvDXfsp7WwQwEnS3PTJgQ085IlLIaQTMa
	tOaw+5sYVDxMgtCzqiqVvYm/abW+SCeq1q3rti9Kj3ddxwI0qqba0nWiMk7rbFLoA4siyzP4qT0
	sebuBVYFiSnTAmbC8uirzBZhhvIgUZ+Dg6gVdwlqUamJUfAcH2Zz7iLeM/4RYaT1Ih00AkjWsr2
	vnY6t7hLBE1PM3YWqJdX1IyF0jjkwLOUwsXfpc5NmcoikrS2Vu2CoyVDCvmuhLd2UmiSTZrP66q
	RFNlX/6o6BbVdaGa+3MQ062i9Gm4AcjK+j5HgHfhG5uAPWjdy2On2TQYaETPaR30LVqS7S0vONR
	vMZ++8nBKmdWHYPSuw6NBVr8nwdgWa5z0JsVBj9/R5dQVoEj7zHdFjQX
X-Received: by 2002:a05:622a:5c0d:b0:55b:ad12:702a with SMTP id d75a77b69052e-55d6fd1ccb9mr99696231cf.31.1795219110848;
        Fri, 20 Nov 2026 15:58:30 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f8c34sm40034146d6.32.2026.11.20.15.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:58:30 -0800 (PST)
Message-ID: <2ed2823f-298a-49e0-98d7-58545f09b304@gmail.com>
Date: Fri, 20 Nov 2026 15:58:27 -0800
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
Subject: Re: [PATCH net v3 03/10] net: au1000: disconnect the PHY before
 freeing the MDIO bus
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 hkallweit1@gmail.com, linux@armlinux.org.uk, shaojijie@huawei.com,
 horms@kernel.org, runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com,
 sebastian.hesselbarth@gmail.com, linux-kernel@vger.kernel.org,
 manuel.lauss@gmail.com
References: <20261117193223.2795612-4-f.fainelli@gmail.com>
 <179517075464.3136.12005891937960917967@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179517075464.3136.12005891937960917967@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/26 02:32, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in case
> you want to address the nit picks below when you respin.
> 
> Low priority / nit picks for your consideration:
> 
> - [Low] The commit message of "net: au1000: disconnect the PHY before
>    freeing the MDIO bus" partly misstates what the patch fixes, and…
> 
> --
> 
> net: au1000: disconnect the PHY before freeing the MDIO bus
> 
> This commit adds phy_disconnect() calls to the au1000_probe() error path
> and to au1000_remove(), so that phy_connect() is balanced. It also makes
> au1000_reset_mac_unlocked() skip MAC control register accesses when
> mac_enabled is clear. It also resets the MAC in au1000_remove() after the
> PHY and MDIO bus are torn down.
> 
>> Balance phy_connect() on probe failure and removal. Otherwise PHY
>> interrupts, device references and the attachment to the freed netdev
>> survive teardown.
> 
> [Severity: Low]
> Can a PHY interrupt actually survive teardown in this driver?
> 
> mdiobus_alloc_size() sets every bus->irq[i] to PHY_POLL. au1000_probe()
> only writes a real IRQ into mii_bus->irq[] when aup->phy_static_config is
> set:
> 
>      if (aup->phy_static_config)
>          if (aup->phy_irq && aup->phy_busid == aup->mac_id)
>              aup->mii_bus->irq[aup->phy_addr] = aup->phy_irq;
> 
> In that same case, au1000_mii_probe() returns before it reaches
> phy_connect():
> 
>      if (aup->phy_static_config) {
>          ...
>          if (aup->phy_addr)
>              phydev = mdiobus_get_phy(aup->mii_bus, aup->phy_addr);
>          else
>              netdev_info(dev, "using PHY-less setup\n");
>          return 0;
>      }
> 
> That leaves dev->phydev NULL, so the new phy_disconnect() calls are
> skipped.
> 
> On the dynamic search path, which is the only one that calls
> phy_connect(), the PHY's irq is still PHY_POLL. That means no interrupt
> is ever requested, and phy_disconnect() never reaches
> phy_free_interrupt().
> 
> The device and module references taken in phy_attach_direct(), and the
> attached_dev pointer to the freed netdev, do look like real leaks. Should
> the "PHY interrupts" part be dropped from the message?
> 
>> PHY teardown can re-enable the MAC for MDIO even if the interface was
>> never opened. Reset the MAC after PHY and MDIO bus teardown, before
>> releasing descriptors and register mappings. Skip MAC control accesses
>> when mac_enabled is clear, since stopping an already clock-gated MAC
>> hangs MTX-1.
> 
> Would it help to say that the new mac_enabled check also fixes an
> existing hang when register_netdev() fails in au1000_probe()?
> 
> Before this patch, the au1000_reset_mac() call just before
> register_netdev() gated the MAC clock and cleared mac_enabled. If
> register_netdev() then failed, the err_out path called
> mdiobus_unregister(), which does no MDIO access, and then called
> au1000_reset_mac() again:
> 
> au1000_probe()
>    au1000_reset_mac(dev);        <- clock gated, mac_enabled = 0
>    register_netdev(dev) fails
>    goto err_out
>      mdiobus_unregister()
>      au1000_reset_mac(dev)
>        au1000_hard_stop(dev)
>          readl(&aup->mac->control)   <- MAC already clock-gated
> 
> According to the commit message, this access hangs MTX-1. The message
> describes the PHY teardown case but not this change in the
> register_netdev() failure path. Mentioning it would show backporters
> which failure modes this patch fixes.
> 

Agreed on both points. I have updated the commit message to remove the 
PHY-interrupt claim: the path that calls phy_connect() uses polling. The 
message now describes the leaked device/module references and the stale 
attached_dev pointer.

I also added the existing register_netdev() failure case. Probe gates 
the MAC clock before registration, and the error unwind resets it again. 
The mac_enabled guard prevents that second reset from accessing 
clock-gated MAC control registers if no intervening MDIO access has 
re-enabled the MAC.

This is a commit-message-only revision; the code is unchanged. The 
registration-failure path was verified by source inspection, not fault 
injection.

pw-bot: cr
-- 
Florian
