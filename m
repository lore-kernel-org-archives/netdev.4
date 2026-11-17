Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.153.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918541;
	b=D+eSaxjZSE/JgDxaYPEZ77A+6slWDl3BWv+rlNbnCQUzBi6H1QY5boEV4gNC/YNfMm5F
	 v9BGOY5Ta7EWq+yszLFifnptAzTEsnOO7OoBQEScBOSIRAoiUXdrimb3/HnRXke5yf2+4
	 tKM2h5WEH8oycSGAEmSAQSp18ZY2E3h//+cMI0/QOMvcphhB8ITdAvwl4RnlJRm7JBy+j
	 ietFtYDzRd5rOUkFuw1O2HAFBmnTtNiRCksnG71oDm+AyxOVEfNoaNHfSbKmgQhOogo0E
	 xhOFn0dMf9waX6EjkaLgl9IkTypCCzCj+ePTimmSi9n9XA84BmmoiSKNItDpfQn8YBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918541;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:Date:From:To:CC:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=th4sjyqOFXc9pdGpcs6P+cNhjHial6V30dELS1C6k1Q=;
	b=LbKOolDpe8z3jkX0oVrat1h9vlRVGAkoZpoymyvgrRRX4e+KBR2aS/KjFD2jgHnDWL1b
	 JMt04hYQuL0l/2DqmBzJDBwDDPkoLox6Yq5vNXjxVX1jtlDVzmcQOxvZ6KL03FmI66iOR
	 G4q3yHjp1kVy6r8mSa8hKGJLMBGL+oAxjhqR+Qw1jOBGEdViW53R6sI/8K/HTTYR76T9N
	 QKIMUsJ9DRVel9q2dKAzh3SytCuIaaLkoxrd6Q76AB6d6bGcsQ+mPiWf0ttKmmv78gc2z
	 o7Lh5/8ciC5E6WbbYaNry7AwndH30HcGDT9XDk5mrtDEe7IW3l+76pT4/RLDS+7n3Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=c4Ni7IjX;
	arc=none smtp.remote-ip=68.232.153.233
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5FB606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D5FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=c4Ni7IjX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794918542; x=1826454542;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tnheL5y5cUOt8wa2PDp2uibS+aIhKCUDuo5Wx9VylyI=;
  b=c4Ni7IjX+RP03orBaddQMlBqN6kU888o92Zy2FYFqza/kpXioDRQcO/r
   4zS/Rebsbj2LUeXBJWN6b+aRHWZBnD+kQBdDfWtZo2SUJtGpJO/c+DkVW
   neFaFVMWmp6Hs1CnLXZN1D4JNrUz8b+nziUwfIeiEfWbYL7oe86rVnCrH
   G73H3YnV4fKdDmPASVZYUZOciLItmaf1SQC6f0G04T2ci+HbxsD+G+usr
   uX9t3hZGVydMTKi0kkSLt8bewRTOgEDtk42WTYfrdQ17Mf9KJmOIVzpKx
   OyWF/1GubPG2E/IFwW6kednreNfL+dHVJs1fWlOZjNQweIrtUJrx4Wem9
   w==;
X-CSE-ConnectionGUID: EWjlCOLQRkGuCHP7z2jsjw==
X-CSE-MsgGUID: pZ+EZIk+RmmH6YM+gThp5g==
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="66635911"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Nov 2026 05:29:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 17 Nov 2026 05:28:59 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Nov 2026 05:28:58 -0700
Date: Tue, 17 Nov 2026 13:28:57 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Andrew Gaylard <ag@ffroot.co.za>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, <netdev@vger.kernel.org>
Subject: Re: [PATCH net-next] net: sunplus: also fix the byte order of
 1c:50:1e MAC addresses
Message-ID: <20261117122857.kctlh54neeyye5vb@DEN-DL-M70577.microsemi.net>
References: <20261112123738.429728-1-ag@ffroot.co.za>
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
In-Reply-To: <20261112123738.429728-1-ag@ffroot.co.za>

Hi Andrew,

> The driver reverses a MAC address from the OTP when it finds the
> Sunplus OUI fc:4b:bc at the wrong end. Newer SP7021 chips have
> a different Sunplus OUI (1c:50:1e), possibly stored in the same
> reversed order, which the driver does not recognise. If the reversed
> address has the multicast bit set, the driver rejects it and uses a
> random address; otherwise it uses the reversed address as it is.
> 
> Handle both these OUIs. An address that already starts with either OUI
> is left as is.  On chips that used the reversed address, the interface
> now gets the correct address, so configuration tied to the old address
> (DHCP reservations, udev or networkd rules) will need updating.
> 
> Tested on chips that needed each of these OUIs to be reversed.
> 
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
> ---
>  drivers/net/ethernet/sunplus/spl2sw_driver.c | 36 +++++++++++++++-----
>  1 file changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/sunplus/spl2sw_driver.c b/drivers/net/ethernet/sunplus/spl2sw_driver.c
> index 5e0e4c9ecbb0..ab0318bc6f6c 100644
> --- a/drivers/net/ethernet/sunplus/spl2sw_driver.c
> +++ b/drivers/net/ethernet/sunplus/spl2sw_driver.c
> @@ -203,18 +203,38 @@ static const struct net_device_ops netdev_ops = {
>  	.ndo_tx_timeout = spl2sw_ethernet_tx_timeout,
>  };
>  
> +static const u8 spl2sw_sunplus_ouis[][3] = {
> +	{ 0xfc, 0x4b, 0xbc },
> +	{ 0x1c, 0x50, 0x1e },
> +};
> +
>  static void spl2sw_check_mac_vendor_id_and_convert(u8 *mac_addr)
>  {
> -	/* Byte order of MAC address of some samples are reversed.
> -	 * Check vendor id and convert byte order if it is wrong.
> -	 * OUI of Sunplus: fc:4b:bc
> +	unsigned int i;
> +
> +	/* Some chips have the byte order of the MAC address reversed.
> +	 * Check for Sunplus OUIs and fix the byte order if it is.
>  	 */
> -	if (mac_addr[5] == 0xfc && mac_addr[4] == 0x4b && mac_addr[3] == 0xbc &&
> -	    (mac_addr[0] != 0xfc || mac_addr[1] != 0x4b || mac_addr[2] != 0xbc)) {
> +	for (i = 0; i < ARRAY_SIZE(spl2sw_sunplus_ouis); i++) {
> +		const u8 *oui = spl2sw_sunplus_ouis[i];
>  
> -		swap(mac_addr[0], mac_addr[5]);
> -		swap(mac_addr[1], mac_addr[4]);
> -		swap(mac_addr[2], mac_addr[3]);
> +		if (mac_addr[0] == oui[0] &&
> +		    mac_addr[1] == oui[1] &&
> +		    mac_addr[2] == oui[2])
> +			return;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(spl2sw_sunplus_ouis); i++) {
> +		const u8 *oui = spl2sw_sunplus_ouis[i];
> +
> +		if (mac_addr[5] == oui[0] &&
> +		    mac_addr[4] == oui[1] &&
> +		    mac_addr[3] == oui[2]) {
> +			swap(mac_addr[0], mac_addr[5]);
> +			swap(mac_addr[1], mac_addr[4]);
> +			swap(mac_addr[2], mac_addr[3]);
> +			return;
> +		}
>  	}
>  }
>  
> 
> base-commit: 676f3aace662fbbc180b3898b190a372fa2a516b
> -- 
> 2.53.0
>

The fix looks correct to me, but I personally dislike that double-loop. I think
it could be smaller and more readable with something like:

+static bool spl2sw_is_sunplus_oui(u8 b0, u8 b1, u8 b2)
+{
+	return (b0 == 0xfc && b1 == 0x4b && b2 == 0xbc) ||
+	       (b0 == 0x1c && b1 == 0x50 && b2 == 0x1e);
+}
+
 static void spl2sw_check_mac_vendor_id_and_convert(u8 *mac_addr)
 {
 	/* Byte order of MAC address of some samples are reversed.
 	 * Check vendor id and convert byte order if it is wrong.
-	 * OUI of Sunplus: fc:4b:bc
+	 * OUIs of Sunplus: fc:4b:bc, 1c:50:1e
 	 */
-	if (mac_addr[5] == 0xfc && mac_addr[4] == 0x4b && mac_addr[3] == 0xbc &&
-	    (mac_addr[0] != 0xfc || mac_addr[1] != 0x4b || mac_addr[2] != 0xbc)) {
-
+	if (spl2sw_is_sunplus_oui(mac_addr[5], mac_addr[4], mac_addr[3]) &&
+	    !spl2sw_is_sunplus_oui(mac_addr[0], mac_addr[1], mac_addr[2])) {
 		swap(mac_addr[0], mac_addr[5]);
 		swap(mac_addr[1], mac_addr[4]);
 		swap(mac_addr[2], mac_addr[3]);

This should behave the same as your two loops, and adding a new entry is still
easy.  Only a suggestion though, dont respin if you disagree.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
