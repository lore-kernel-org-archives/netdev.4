Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757846;
	b=foII6ns699mfneC9xEuY1TgAxJuB8yLlqMsK8PMSeXu31DeH3CU8rOgUT1Ab6debAwc+
	 6xlC7GdjhjWCMQNxg0zjhmaqE8BEbVMOTENjDTx52WNhfGVhQpCPycV64Z2mWCrAAretD
	 S4ZkNv8ewBTj8807Je7/49NlObVuwxNi9iY43jfbWyhg4+Rr3+TdrvYNIAN2Bib2rvBEB
	 FF1jVUKEWEM3JugV5myMZngtFaU9VP7aRtvXH6uKE+FDGFjCE5IuJXTfUQ1JRcQl/IN9a
	 3NOpuwmavqwUyAmYeBriRLPEInPCjTMXkZvcLlN+WEPxVc52IJsfaQ2whN2xGJ9wiKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757846;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=PbZfORVL5xgmDO/TfVCD+XMF/NZaJoKk+x6Ga6PPhV4=;
	b=IWJQdtznSmY15DiV0bGJWWZbTqzzqDLY+hyNZXjJh+YevsVoKp8wrpUCSK7LrF1M6yh5
	 WqTr0S9K74MqcNT0wrb8ovPKI11y47hdkc2UqcxG+G6wB8SaFgIfT5Bq9ExDV6O0p8O0u
	 g+/fZWPahdEwRT01wXXRK47l2PfmYRoKwQOtnjfAACZbwKBqk17hlMFW5Lb8eStWym0mq
	 ovZaP9jxL7xDXSXex4N/cxHgRncuVbpNzOt3aLkA+vvr+JlY/cSLp6CKaStkUpaqrty3x
	 hb1OY9lV/SLqtiKuqBHsbVtrSQmuCX4lX+8kfaqHI25GZQzNpEqoJwvkKpk1SkqF2yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PwobYmdx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC6E606A31A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PwobYmdx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A8C1F000C6;
	Sun, 15 Nov 2026 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794757846;
	bh=PbZfORVL5xgmDO/TfVCD+XMF/NZaJoKk+x6Ga6PPhV4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=PwobYmdxfHIMzhA4+Zq+HL3CY2vmaHDE/xFJe9fXRkpICfnRPR+hSWnlNaxEx2uLK
	 jpXQgy0kimladVz5zRgd4n0gMRjTFVJ/CqzV2uHsDXqgV/GuSI7rwnI3DuMEEM6ktd
	 D6YQI5qjnXu9iANftahObYwMLwX4jWf+dfgcgilNl3lX509Yz4ayvjSstdESmFR4dJ
	 c8aK9gnSM6r5H9S2Fu+TqZpuHk/uhCo1+3lVCZL7B0SeHbEeoGcMV4Hwn4vERAnnYy
	 p0oB4r4k7H5pNEEXLHJqP9vjJjCJp7rT7cRd2q5gac6p4J94/t4tn0phY8EGCY3m8I
	 /RipBsaBGFg5w==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id D4864198003A;
	Sun, 15 Nov 2026 10:50:43 -0500 (EST)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Sun, 15 Nov 2026 10:50:43 -0500
X-ME-Sender: <xms:0dT5arm6Dp3a8FxOxXEQgLrqzC64ooP4It6BNXiSv50HSO3ckZQTMw>
    <xme:0dT5apqKIofDUMuWfW8b4F6GflGhSmLnrVEu6BZhKi8vfJdKLhw5_81KE0DgvW46R
    wca6G-oPBmm7W-k7CVU28rB2sJIBOOCxx6Zs6gk8FidTbcFS84Wryq8HA>
X-ME-Proxy-Cause: dmFkZTFvi90+F0yW8VL9fWr7gtH+c1ShC0zr0Y457aBNuqIb/5ITU1xQRrWjz2aAFdQrLe
    jzaG7NKJhA6BL3JofXTqCfCV1cdp5oSx471lg//Jtse8K1ZowT49Vz86lQuH9CoOrY/HT+
    bbqWDzqaAhd+wiWPDsYmvnGM4L7Z68plT2Wh4TxlxhlZhS+nKp8QOwY8fYvsSbRdDmXa0u
    1VXC8saVctOsZs5BnOp6zvHLjdz64wmc5rT5zMo0se28YGFOwNUkhgcTJ8NeWz5alquLsG
    Y8PaallpJJIR+jVO9PjrZUYQzCFIxHxpvOX+gXCp2NF36Rf1J3yYd54C0bWBLTTyWZqXeV
    HCGbWVtjvJWdzOKaksI6Nn+PqUZpalVnQEzRhtzXWeEOi7W+69l8hxG0NGZ10FXpfqElcB
    hCOvoVQPArXrHRwnL9bFTqvhUFi3LtbwECdulJbubHyrhTlQPwijFWxnFJEokF4sN9EeEY
    Qp2dUNLu8bTSG5/+xBbN2BxLsazhVsK6gpFlNeiosJDqeICKC8DGnnLnUo5pVHBb1MxdJG
    hXlZ4Nq31S9QdfCcrxde4oRmhdMJGNgnskmpgwgPVX+zCioRf0N0dzuDcYJad9a6REOT8K
    gaTHcV98sw0NYyh4LfxvoMxxOqrS3oAOBwgXNnhj/LMktqdLZpULa1/j5Kjw
X-ME-Proxy: <xmx:09T5asD1gAV8kcV0bh8aXxluLRSjwVeJkpQG5Q5SKiK9qB-uzN_aaA>
    <xmx:09T5ajfYP09VyVWFhilJ68nFfpEb52rNcYHlU_VgeLO8zjk5c131zQ>
    <xmx:09T5aj2ppKA5knJ6ZMO4QFLM-oaKvQ_4j1XCsziHydpLqS8jGHVmSQ>
    <xmx:09T5aiiTBlKzvzjl2gLXfjh43HejEB_xRUE4D1yrbEq7mm6Hofm4CA>
    <xmx:09T5akmU6fbSuL860k_h1pMou90X9nD8bbMRtO3TkTN3UXHaCduDSkfY>
Feedback-ID: ia3204a8f:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8A2652F8005A; Sun, 15 Nov 2026 10:50:41 -0500 (EST)
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
Date: Sun, 15 Nov 2026 16:50:13 +0100
From: "Imre Kaloz" <kaloz@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "Elad Nachman" <enachman@marvell.com>,
 "Oleksandr Mazur" <oleksandr.mazur@plvision.eu>
Message-Id: <e53f74da-5847-4b4d-9168-31ba42569830@app.fastmail.com>
In-Reply-To: <179474035815.2199510.3439417604844193452@kernel.org>
References: <20261111101521.9878-1-kaloz@kernel.org>
 <179474035815.2199510.3439417604844193452@kernel.org>
Subject: Re: [PATCH net] net: marvell: prestera: disable port before changing its MAC
 mode
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sun, Nov 15, 2026, at 11:59, netdev-bot+sashiko@kernel.org wrote:

<snip>

>> @@ -339,6 +340,17 @@ static int prestera_pcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
>>  		break;
>>  	}
>>  
>> +	/* Firmware may not report link up after the mode or inband setting of
>> +	 * an enabled port changes until the port is disabled and re-enabled.
>> +	 */
>> +	if (old.admin && (old.mode != cfg_mac.mode ||
>> +			  old.inband != cfg_mac.inband)) {
>
> [Severity: Medium]
> Does this check catch a change between 2500BASE-X and SGMII?
No. Both use PRESTERA_MAC_MODE_SGMII and phylink selects inband for
both, so swapping a 2.5G module for an SGMII one on an enabled port
skips the disable. v2 will also compare the speed and set SPEED_1000
for SGMII, which is the speed the port already runs with on the SGMII
path I tested. I have no 2.5G module, so the 2500BASE-X case is
untested.


Imre

pw-bot: cr
