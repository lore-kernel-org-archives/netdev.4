Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795420592;
	b=lWYyD76da6eWiOfnZAveU90BBHfmyaBDfti3Ynwus2c9czTz1N+tz/rlEf6KuEF4eFPP
	 kYg80bXm7qgcFd3Wu5DuWxPYFfkbDUbCKgVkcL2uy32si3Qr0v2wialjWkXYWLxCjmGAs
	 Zpo/X8Vz0eia7ubLxeiK6IYLQL0X4JnAI9F0cG1T0g/x4BUnbOwREiC59fpNlCLQi8teO
	 mz1WjS+tH2w216c1InlMPJAWt/lasP1A5PBjlGUL+BcC8KGEdLh9oTmWLPCPatqZ4+wur
	 ehtOPT1jIozAyPUK9OBMgXhsNqnCo2bTT2WnZbI9uzf/pJiQ1VGzqDd9xBa/ERn2HqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795420592;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0t4b/Qrw4yRrOcM6IJZhKh0+8lcwSixNn61ToWP1MHc=;
	b=TD2bbSGhYYdhffjQc7897IYGQEaH8K4kdqZNPzZlzM1z8hrJ0IxtYfF0Rx6s0MgXMxba
	 gkpYTaEnsbS+6PDdjZeuTK+3OXachsah3h37kqDVhESPFI9cnp36FYeKXoqQXRelIkLyP
	 7dI3VxK6HwX4+F9ArilbQEtYjkMhEDWyLL1EV9FGVvpC8H05oUU4ggK/Ku7o9A892V1ic
	 kFzeHXK3YdNiJDnFZEbei4DvA0DnbNQfwagHduFb00pmRhKc6Jv0fuF7dVOR9DeqwhnJT
	 xvw0wniM2zc9cu3k28esvJd62fRiGe10OCWG1XrCoWqA+0YwTIf/I09zdWPj5FE162w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=EHtbTEXr;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B26606A68E;
	Mon, 23 Nov 2026 07:56:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67B26606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=EHtbTEXr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1795420593; x=1826956593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aVHwpw/FD6pKxcpupPVa+nHhi8ImbmRxTL9k4y+v1VI=;
  b=EHtbTEXraI3wdjsngGGIyWZTtduVU8101VWiZVHxseTjzW+RNjXWp//O
   A+6WEiegxWHjyciUnJlsldmm81mtht9EvCq5hDtTzyyi/JfS4tLffVLVo
   fSEkrjjTyh6l1RJdrQk+tzwnDrI+Mrq4eH+RZoGJgjuvpt5lLrJ12S81e
   9jJaV0D61rUo33/XzbO8buaWXre4SW/CSIE3jtMEBK083/fd5At9vWIPf
   NmKEYtKp2rE6yc3afApYKB36y6M7FAf3jiTiJGWvi6fUzAlJXD37FBuWs
   PTPkKTpBxYBzZQiv1PJEKBBFHQr1tvZdhfUm4R/sXXhdqgXBajDRHkVkc
   w==;
X-CSE-ConnectionGUID: ritJ1AcqSF+GWKgCqeULuA==
X-CSE-MsgGUID: 1v7AMAg7TiC5geIKHAp9mg==
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="66915052"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 00:56:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Mon, 23 Nov 2026 00:56:25 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 23 Nov 2026 00:56:24 -0700
Date: Mon, 23 Nov 2026 08:56:23 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
CC: Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>
Subject: Re: [PATCH net-next v3] net: sparx5: check DT port reg against chip
 port count
Message-ID: <20261123075623.7pgmsdn32x4vselo@DEN-DL-M70577>
References: <20261119094613.klyjRQ7HPrCZV7VwnhNzSf_Ev6wIWbyixM5FfrNrJS8@z>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261119094613.klyjRQ7HPrCZV7VwnhNzSf_Ev6wIWbyixM5FfrNrJS8@z>

> From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> 
> mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
> portno, which sparx5_create_port() later uses to index the fixed-size
> sparx5->ports[] array:
> 
>     sparx5->ports[config->portno] = spx5_port;
> 
> The value is never validated, so an out-of-range 'reg' (runtime overlay,
> corrupted or attacker-controlled DTB, kexec-supplied or bootloader
> fixed-up DT) turns probe into an out-of-bounds write.
> 
> Skip port nodes with an out-of-range 'reg'.  lan966x_probe_port() has
> the same bounds check but fails probe with -EINVAL; skipping here keeps
> the remaining valid ports working.  The bound is the per-chip port count
> from the match data (sparx5->data->consts->n_ports), so lan969x, which
> shares this probe path and has only 30 ports, is bounded correctly as
> well.
> 
> Found by a scripted scan of of_property_read_u32() call sites used to
> index fixed-size arrays, followed by manual review. Verified at runtime
> on a pristine v7.4-rc2 arm64 QEMU virt machine (inline KASAN,
> CONFIG_SPARX5_SWITCH=m): an out-of-tree module supplies only a
> malicious DT overlay, the unmodified in-tree driver performs the store.
> reg = 15839 yields a KASAN use-after-free, reg = 0x20000000 a wild
> write 4 GiB out (paging oops), and reg = 65 silent in-struct corruption
> with a later NULL oops. With this patch all three are skipped. The PoC
> and full logs are posted in the thread. Not tested on real hardware,
> QEMU virt (cortex-a57) and compile testing only.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> ---
> v2 -> v3:
> - Fix the diff paths (a/a/ -> a/, b/b/ -> b/) so the patch applies
>   (Daniel Machon).
> - Restore the in-body From: line so the author matches the Signed-off-by
>   (checkpatch author/Signed-off-by mismatch).
> - Clarify that lan966x fails probe instead of skipping (Daniel Machon).
> 
> v1 -> v2:
> - Check against sparx5->data->consts->n_ports instead of SPX5_PORTS,
>   so that lan969x (30 ports), which goes through the same probe, is
>   bounded correctly as well (Daniel Machon).
> - Document how the issue was found, the runtime verification and the
>   test setup, as requested by the patch bot.
> 
>  drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> index 08a398adf..164706745 100644
> --- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> +++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
> @@ -845,6 +845,11 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
>  			dev_err(sparx5->dev, "port reg property error\n");
>  			continue;
>  		}
> +		if (portno >= sparx5->data->consts->n_ports) {
> +			dev_err(sparx5->dev, "port %u: reg out of range\n",
> +				portno);
> +			continue;
> +		}
>  		config = &configs[idx];
>  		conf = &config->conf;
>  		conf->speed = SPEED_UNKNOWN;
>

The patch looks good to me.

However, the AI review flags a pre-existing issue, about two port nodes with the
same 'reg' leak the first port's phylink. To me, that strengthens the argument
that the device tree is considered trusted, as we would otherwise have to
validate every DT property in the driver.

That said, this patch fixes an out-of-bounds write, and other drivers do the
same check (lan966x in lan966x_probe_port(), and ocelot in ocelot_vsc7514.c,
which also skips the port). So it might still be worth having.

I am unsure here, so I'll leave it to the maintainers to decide.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
