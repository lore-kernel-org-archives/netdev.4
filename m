Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.88.97.239
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830858;
	b=rkl64PTe4rvnhACGTpi93hle406YJUyY6LVObN3YV4l9Tymy+w0d1drw2snLM+SvTjs+
	 sAIu9w7kBgzdMpzSng5ZOY1K4pFaa8haBkSqklo0ZapJDewAvUTxcwIVSpfXIByUHOgxs
	 ob6jNqkJAOjiyqkFDcSqDEfAoZaJM1zfl1USz62WOakZPKXgL4qBwV+bIJFMapaqXdSRv
	 fQp8AKDhfvwyEXMfhG4+iT5NyBp8pZ8CEZ0pv+J4CqeRPatrOrdCSjJkqPlGPanxpMJTa
	 UpEtq2CE96syoozkTgWoL8f35K00EzYG0NnUxGBIrja3ouClZdYoUDF7Ot+TjemnOJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830858;
	h=DMARC-Filter:DKIM-Signature:Received:X-Spam-Checker-Version:
	 X-Spam-Level:X-Spam-Status:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=u3833NKeLPjiqOyEByXYIJt2R5I3PAKcaP2ukAFb36M=;
	b=K7YeYvdzCKIMDiBFK3fslAVGFcNp8vzo8jkN/0Ux6Bh5/r8dDeRf86+4XEfw0K8qFvbI
	 4BhUc5BW+G7hB9j6wBViqVrhZaFeScdBjO75dpV6Kfb2pA9kAUV0rXbr6WIAJm+YsCH6K
	 zcWSeDlkd7CGsVDNJFFxF/4jVzBqX/j/XuHODw301vZJEPZ0jJ7TFQxcrFebAr86AeNQi
	 GZocGZ3kEzG2m8t5w6uqGS2vFoQ0ZCgMs4BKAn33+IZpd3prdtGRdGLCTc232sCJwWVPc
	 I/Hjihwr0nRGZMl72zfY1M5UsbqNGX/QigjYOGgONOzTPly+gAx8WiimsTIh0e5Y8fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=birger-koblitz.de;
	spf=pass smtp.mailfrom=birger-koblitz.de;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=VHgpSQ0G;
	dkim=pass header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=tfK5g5pP;
	arc=none smtp.remote-ip=23.88.97.239
Received: from bkemail.birger-koblitz.de (bkemail.birger-koblitz.de [23.88.97.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5E5606A331
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F5E5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=birger-koblitz.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=VHgpSQ0G;
	dkim=pass (2048-bit key) header.d=birger-koblitz.de header.i=@birger-koblitz.de header.a=rsa-sha256 header.s=default header.b=tfK5g5pP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794830850;
	bh=HpaVKDwJ8mo611FaGYokkwyxAI2OWY+pBQYjyGtdr6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VHgpSQ0GdzdJVaSkI9H1Y/qTP+GEL4QaIH7DJBhcgKHuLy4tJ8jn07CBms6FHo8oO
	 YPityKNeTvWEvBZK5eg3vxL4f2jMYX9FRlk0giNxdaiee7++9PpHmyTA/avQXxYcHB
	 6wpl8p214ouPXSQdzxPEsq9ihZskzCxtmSCag3aaWfSvehWeYBNSnbTDYh8LDzsNGp
	 QZJOIIj6jWdKy3OX7PRApdHcYExEI+f2Xy0jLnln3qVYQul97JBi0t2ujZHzSiIPIH
	 iA2RhUCjUTJVUI4mk/DMZNqwaagooYecaXBRV/3Sx3UE+In3BhPSwzI+6oM1nhcOfi
	 oP50Myy2eoVcQ==
Received: by bkemail.birger-koblitz.de (Postfix, from userid 109)
	id 3789B489F4; Mon, 16 Nov 2026 12:07:30 +0000 (UTC)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=birger-koblitz.de;
	s=default; t=1794830848;
	bh=HpaVKDwJ8mo611FaGYokkwyxAI2OWY+pBQYjyGtdr6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tfK5g5pPKHaONqmviwc34ouBZF0p2lumJ97hwGmJurzmujDz7r9vopJsTLvSawqmM
	 2IRVlJGYbK0Q09L+nh7QOax9p6IqICTXO9SJ2TPMCOEPgYdqn1OSSKNI6D7OwJzWY+
	 HPRpmnLywgleJk8txOB7u7qJhAngGroxbZRE9A+6ZO98Y+yn7mV5DnyWCBrLfPk04V
	 UCSeNinAI7WcD3Mlet0Os8fic/qBsa/aX003xhfbxqr96DSu/IeFxZE5Jvl3KgYaLl
	 p0Y2TfZiEGJZmQytoZ8qMqznSSSxwCAc1Xx/7RaqZEbQcML5l8rzIwhupb/223Qncl
	 cEca/gAJC+wNg==
Received: from [IPV6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb] (unknown [IPv6:2a00:6020:47a3:e800:271c:c6c5:9fde:77cb])
	by bkemail.birger-koblitz.de (Postfix) with ESMTPSA id 07A873F1D9;
	Mon, 16 Nov 2026 12:07:27 +0000 (UTC)
Message-ID: <02b33fd3-867a-431f-b1f5-2fd15eb9ae1d@birger-koblitz.de>
Date: Mon, 16 Nov 2026 13:07:22 +0100
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
Subject: Re: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
To: oraveeps@pm.me, Hayes Wang <hayeswang@realtek.com>
Cc: "javen_xu@realsil.com.cn" <javen_xu@realsil.com.cn>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <PfNGg6VjMdDzTCX2LETCm65NKSR0af1EG7ZX5CI-7Fef0x8NE2MnZ8fNtgr1Hm86sNjqHXcNyyqIbbeZL5jDu7URTqMygnyj4ulG00NxR7U=@pm.me>
 <7b6ef8fb2c14485380c90f1f7521ea9b@realtek.com>
 <tPt9UQiUVXfE9K4MHjmkc9no1QcTNZAOhmdtvdx_yaIkVdWoxkTdDFxCdBK5RU5nKHrKGy99QZq_rUsF0mWO9bfPZmS_8tjbbrNl2B5mNwg=@pm.me>
From: Birger Koblitz <mail@birger-koblitz.de>
Content-Language: en-US
In-Reply-To: <tPt9UQiUVXfE9K4MHjmkc9no1QcTNZAOhmdtvdx_yaIkVdWoxkTdDFxCdBK5RU5nKHrKGy99QZq_rUsF0mWO9bfPZmS_8tjbbrNl2B5mNwg=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Could you try:
https://gitlab.com/koblitz-rtlnic/rtlnic_fw
I used that testing the drivers. It is based on the source of the 
out-of-tree driver and creates firmware files compatible to the Linux 
driver. The firmware needs to be generated from the source.

Birger

On 16/11/2026 11:37 am, oraveeps@pm.me wrote:
> [Resent as plain text, the lists rejected the first copy as HTML.Sorry for the duplicate.]
> 
> On Mon, 16 Nov 2026 at 09:30, Hayes Wang <hayeswang@realtek.com> wrote:
>> Hi,
>>
>> Could you please try out the attached files?
>>
>> Best Regards,
>> Hayes
>>
>> From: oraveeps@pm.me
>> Sent: Sunday, November 8, 2026 5:42 PM
>> Subject: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
>>
>> Hi Hayes,
>>
>> Since commit a51e171e176c ("r8152: Add firmware upload capability for
>> RTL8157/RTL8159"), mainline r8152 requests rtl_nic/rtl8159-1.fw for the
>> RTL8159 PHY. Without it the link stays at 5 Gbit/s, and linux-firmware
>> has no rtl8159-1.fw yet (nor rtl8157-1.fw).
>>
>> I run three RTL8159 adapters (USB ID 0bda:815a) on kernel 7.2.4. They
>> reach 10 Gbit/s only with Realtek's out-of-tree r8152 v2.22.1, which
>> carries the PHY patch inside the driver. With rtl8159-1.fw in
>> linux-firmware, the in-tree driver could do the same and users could
>> drop the out-of-tree module.
>>
>> Could Realtek submit rtl8159-1.fw, and rtl8157-1.fw if there is one, to
>> linux-firmware? I am happy to test a candidate file on these adapters.
>>
>> Thanks,
>> Jonas Autzen
> 
> Hi Hayes,
> 
> Thanks for the files (rtl8157-1 and rtl8159-1, v1 11/13/26). Mainline
> r8152 (v7.2.4 here, same code in v7.4-rc1) rejects them at the first
> block: rtl8152_is_fw_mac_ok() has no RTL_VER_16/RTL_VER_17 case for
> RTL_FW_PLA or RTL_FW_USB, so rtl8152_check_firmware() fails with
> "check USB firmware failed".
> 
> An rtl8159-1.fw with only your PHY_SPEED_UP block (checksum
> recomputed) loads with the in-tree driver on 7.2.4 and links my RTL8159
> adapter (0bda:815a) at 10G.
> 
> The series "r8152: split RTL_VER_17 into QFN68 and QFN100 package
> variants" (v8) does not change rtl8152_is_fw_mac_ok() either, so the
> full files are rejected with it applied too. Is a driver change for the
> PLA/USB blocks planned? If not, could rtl8159-1.fw carry only the PHY
> block?
> 
> Thanks,
> Jonas Autzen
> 
> 
> On Monday, 16 November 2026 at 09:30, Hayes Wang <hayeswang@realtek.com> wrote:
> 
>> Hi,
>>
>> Could you please try out the attached files?
>>
>> Best Regards,
>>
>> Hayes
>>
>>> From: oraveeps@pm.me <oraveeps@pm.me>
>>> Sent: Sunday, November 8, 2026 5:42 PM
>>> To: Hayes Wang <hayeswang@realtek.com>
>>> Cc: javen_xu@realsil.com.cn; mail@birger-koblitz.de; linux-firmware@kernel.org; netdev@vger.kernel.org
>>> Subject: rtl_nic: request for rtl8159-1.fw (RTL8159 PHY firmware)
>>>
>>> External mail : This email originated from outside the organization. Do not reply, click links, or open attachments unless you recognize the sender and know the content is safe.
>>>
>>> Hi Hayes,
>>>
>>> Since commit a51e171e176c ("r8152: Add firmware upload capability for
>>>
>>> RTL8157/RTL8159"), mainline r8152 requests rtl_nic/rtl8159-1.fw for the
>>>
>>> RTL8159 PHY. Without it the link stays at 5 Gbit/s, and linux-firmware
>>>
>>> has no rtl8159-1.fw yet (nor rtl8157-1.fw).
>>>
>>> I run three RTL8159 adapters (USB ID 0bda:815a) on kernel 7.2.4. They
>>>
>>> reach 10 Gbit/s only with Realtek's out-of-tree r8152 v2.22.1, which
>>>
>>> carries the PHY patch inside the driver. With rtl8159-1.fw in
>>>
>>> linux-firmware, the in-tree driver could do the same and users could
>>>
>>> drop the out-of-tree module.
>>>
>>> Could Realtek submit rtl8159-1.fw, and rtl8157-1.fw if there is one, to
>>>
>>> linux-firmware? I am happy to test a candidate file on these adapters.
>>>
>>> Thanks,
>>>
>>> Jonas Autzen

