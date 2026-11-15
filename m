Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794783072;
	b=LUCEMLh+j56/bYqcKcov/QjZN4u1c3aUSWW9hSrl3UJ7cB/tdAUVgJahole0HJ/K6JYC
	 5kO2lxWDHN0tktLrPHIGz2P71F57vqrTYOyfjZL6OzAWPgQtujyqbtnzkvhfmSeHlYfHH
	 Db5pyltBcF5HrqWjjHb0He6aoX3hXCOsa0BMZrtQtoAyCAFnKf6lD8TNTJHAyUtNTGKQO
	 T9+Zw8IOmA1++XHVqnA85wBYUNTPis0bowA9Sxwk3+uALdcQb6JDfAaUP8oNQt+UH5zCQ
	 B+U7HoGqfi1jSgxUUp6zP2jQX5PDogJPU5dDI+Rd7lg8QGvAsQV78gXiSl41I07BcIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794783072;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=D3mzLcFvo9mS0Li7vIPTrzwd8eAC+u78WLPEJvvVn5w=;
	b=PmERRr4SzVfhGg87t+TJnIkaTY3I0GmTCIhL8ZiSW7f1Gr2HtQPlem1wbYAvd2QArXY6
	 /JkdYpGXXOmSEFU1DMRUww+Abla7yN9SylSb8iHAfG1jmFAcjpvK9VNFusg6Pw1vYF2Fr
	 TaSEBbKJuxB75Q9H9paHNiSluqOEH4KQYQo/QALoSww3rZ6FnyTEhwc3Q1Tyv6o3INnla
	 vKX3orwCwIoKOSSjF+iVS/bTX1g7RGt2MKSln6OlojGZVgJ35j5TkEj6UOcHcJP+T34/w
	 xZzzAe91Eca0wq5vpWkwrHCB/ugEj/7gaFydnpSF5BjVCguJh0SbiVDS8s0reF0oE+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IyCn9hBT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FC4606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 22:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IyCn9hBT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2FCA1F000C4;
	Sun, 15 Nov 2026 22:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794783072;
	bh=D3mzLcFvo9mS0Li7vIPTrzwd8eAC+u78WLPEJvvVn5w=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=IyCn9hBTDwd+BXsDUDKuP7TRIfUtz/3nd23IE/Z9Nm2vCnKG+27ncQAPZC8UOGvvs
	 ngSPFZ90UX6NRPaSfWQSPxxlUuu6FR+ChYLutE7PaqHTfZoVVlF2Qfw0Jyh9fu997n
	 uVNsyenC3Bqc1NwCpKoYs85CjhssMojM4QPy8YsJ9cXqssxav0Q29rqP0f6Myr3BE8
	 W1P5WYRgFQdquz3O1QG6RdZxHxGiEQa+gP9Qws5vkN3isNxo+Z2UFgfIPM/UxnGUzx
	 4aRHc1Pi3HcKzosAOg4R8xpoNgiK46pqKCFRdOjNNtUNW9buWedxaIUS5jzC3feELl
	 iFe8cwNR7c0Ag==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id 3C009198003A;
	Sun, 15 Nov 2026 17:51:10 -0500 (EST)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Sun, 15 Nov 2026 17:51:10 -0500
X-ME-Sender: <xms:Wzf6av2sCzyLNFEGWgfrcaK3FE6PaTO9yWQhyVJEDxofwqWPQlS6PQ>
    <xme:Wzf6ao7JLsnAQvstX6lwGsq2ptK0B3YXlsoTF3cudOAG_s55XcPIE1msHz2DbZyiD
    3UaPFcEwNPBs8Wet9c_EuxATYf1CA2lampxehEpGVAuKY9LUTWiTjGN>
X-ME-Proxy-Cause: dmFkZTGFVelylG9Fs6YXmYo6ufowmflM2xIi3GLx9bd2COtxcMxRDdby4dhzYdqsYUfzOi
    SyV5gZUyFEqidS3OyFrsQz8CzCXzO/GQbDufhtmh8vlH5BtzMEjqvC9zhouXZo8AF/hcL8
    WLqvYZJZjRdS4k2AifKr9na39n8fNVr48YM/IvxDe5N1d+6qcFsELEGsH21J30Z4GcLCEJ
    uAJqfVmogALHFVvMO6N6UjR3TjcVttGmepkUNGvmg5GlUzEKRdPH2eGJMWUubp201sUsig
    ggxMSsoeF3WJ/ceIQLkiJ3B8X9LNPS/3KgLPDNhT4aZGNw+TD4EgkHjlK9iXVZMO9bbwck
    vqKWTJzJOaxsFVvU9x7pPsgiO4IZWMJpK5Wm+ZFPj7WHkamYGcDJOhjl9TOBlr1m9pXfOG
    LHgoHC8i0dtSr+u6B9I5mvGTplaqOR+hnojX2aF5Bf36dqGgGPNXOrd20uC/NTXdItvSth
    PhtZpfix3GnM/fPj2wGhs0oB4dBP6BuxN1lfP7YQsofAKk372H2qfcUzXJuCl+MwMEJ0Iq
    tJvKC8w3XlA4E0Bm8KONQ6I8qPSAoWZeaBa+FwGAh2KaJ5aQWSld1DdchcuSHgSwASjgtH
    ANwlX/GIteBcBAMr2S3SuPv1TszhBwNLhdYMemvQMmnHUU+QTsq49Fmjj6qA
X-ME-Proxy: <xmx:Xjf6arJpuD-xRcgMsfTn286cPRTOMfYm3lfYL1vegbMD4LarcUvV_w>
    <xmx:Xjf6apIKfBENZY2MFYh_OkVr0nMSrocK6Qsd5m0FodO3EJ7EBVBsAw>
    <xmx:Xjf6aqU6JmZiWc9xKFxEACOOogZV9FXi8YLD6gGzHaPSHsEsYkNYZQ>
    <xmx:Xjf6aik0y91oWDm0-m_tOkAE_u1YKP0Nol6h_mrfZhOA5CXPFTAIxA>
    <xmx:Xjf6aglc8SbTJ0-p-AHVEhsL0i9wth55wupvWC9dkmmm-3eAagoUWUiz>
Feedback-ID: ia3204a8f:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CC5FC2F8005A; Sun, 15 Nov 2026 17:51:07 -0500 (EST)
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
X-ThreadId: APqG7cBtEf9F
Date: Sun, 15 Nov 2026 23:50:37 +0100
From: "Imre Kaloz" <kaloz@kernel.org>
To: "Elad Nachman" <enachman@marvell.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "Oleksandr Mazur" <oleksandr.mazur@plvision.eu>
Message-Id: <80c7731e-41ee-4e14-a262-a2bc18136ef6@app.fastmail.com>
In-Reply-To: 
 <BL1PPFB0715B38B6145C7DCFD147033D05BDB7D2@BL1PPFB0715B38B.namprd18.prod.outlook.com>
References: <20261111101521.9878-1-kaloz@kernel.org>
 <BL1PPFB0715B38B6145C7DCFD147033D05BDB7D2@BL1PPFB0715B38B.namprd18.prod.outlook.com>
Subject: Re: [EXTERNAL] [PATCH net] net: marvell: prestera: disable port before
 changing its MAC mode
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sun, Nov 15, 2026, at 17:49, Elad Nachman wrote:
>> prestera_pcs_config() writes a new mode or inband setting to a port
>> that is already enabled, as when phylink switches an SFP port to
>> inband SGMII. The firmware can then report link down and no link up
>> until the port is disabled and enabled again.
>> 
>> Disable the port before such a write. Exercising this needs a link
>> partner, so no in-tree test covers it.
>> 
>> Fixes: 52323ef75414 ("net: marvell: prestera: add phylink support")
>> Signed-off-by: Imre Kaloz <kaloz@kernel.org>
>> ---
>>  .../net/ethernet/marvell/prestera/prestera_main.c  | 14 +++++++++++++-
>>  1 file changed, 13 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/net/ethernet/marvell/prestera/prestera_main.c b/drivers/net/ethernet/marvell/prestera/prestera_main.c
>> index a82e7a8029851..39ebd1944be55 100644
>> --- a/drivers/net/ethernet/marvell/prestera/prestera_main.c
>> +++ b/drivers/net/ethernet/marvell/prestera/prestera_main.c
>> @@ -307,13 +307,14 @@ static int prestera_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
>>                              bool permit_pause_to_mac)
>>  {
>>       struct prestera_port *port = prestera_pcs_to_port(pcs);
>> -     struct prestera_port_mac_config cfg_mac;
>> +     struct prestera_port_mac_config cfg_mac, old;
>>       int err;
>> 
>>       err = prestera_port_cfg_mac_read(port, &cfg_mac);
>>       if (err)
>>               return err;
>> 
>> +     old = cfg_mac;
>>       cfg_mac.admin = true;
>>       cfg_mac.fec = PRESTERA_PORT_FEC_OFF;
>>       cfg_mac.inband = neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
>> @@ -339,6 +340,17 @@ static int prestera_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
>>               break;
>>       }
>> 
>> +     /* Firmware may not report link up after the mode or inband setting of
>> +      * an enabled port changes until the port is disabled and re-enabled.
>> +      */
>> +     if (old.admin && (old.mode != cfg_mac.mode ||
>> +                       old.inband != cfg_mac.inband)) {
>> +             old.admin = false;
>> +             err = prestera_port_cfg_mac_write(port, &old);
>> +             if (err)
>> +                     return err;
>> +     }
>> +
>>       err = prestera_port_cfg_mac_write(port, &cfg_mac);
>>       if (err)
>>               return err;
>> --
>> 2.47.3
>> 
> 
> Reviewed-by: Elad Nachman <enachman@marvell.com>

Thanks, Elad.

The Sashiko review found that a switch between 2500BASE-X and SGMII,
which share one MAC mode, skips the disable. v2 also compares the
speed and sets it for SGMII. Since that changes the logic you
reviewed, v2 will not carry your Reviewed-by; I would be glad if you
could look at v2 and add it there.


Thanks,
Imre
