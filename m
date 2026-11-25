Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795570712;
	b=ZOOXjnpU7+E6UmK+6mHkmWkij4aurdMqtHgkZQwvk1sMh6ALkOl59ne+3Vmx6fYRf7cy
	 g8Y6YxJkGjL1v2rCZLvwneRQhVhfC5xDEk7G0guGNaUq19xq6G2n4WaxSkBS+h05KgzkB
	 p1/Lop9Ywc29HYQqw4VDXyLNjjGsbpMUoijLhzhu4BWULVp2v4V+ybaohdf4r/u0iXTv4
	 9EsymDHQS3XZ7xpIG71oCPavruSYGgfl2YtLgGmHC5Yxwv6QuVEKUg/s6BfoQ9IEunz19
	 1C+qb+OWhoFzxv+9SSkJndmNxOM/Si5VEFCk/oCDDm5BqqJvQjhzrrhsqySwyPY8jRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570712;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=s5bcCRaIoObF4zt/9kKrdifIxsiu8jj17RiYs/Ox6xE=;
	b=HlsgxSezYMrKASoW/CJCjJxThwHPo3xBcNveSV9dFJTmHQD5EcQswPtWG1mKeKl0cWIE
	 21ggDaQI0snvlvtPHuBQfbAAIuOoNzZTEAUOjVUwYP8zXda8eLRb9WhsUXCjTm4bVPG0r
	 P6k6+SFyT3kdqZwbUOdSot+3h6YDklP2gM14avjLTmyW2dkEsTjCftujH/L1BGizPwWT4
	 81qBnJXMX3CMceKHECqfXTINoDVW1GBjLz06Lc7in/DSTpoXajUCbMDRB7zlVhaaWH6EJ
	 9Vg7HZjuXvy7G9URTTEGpurqHlRwOhJGG4PCqYopdGn0MwNEpaJW3DP8zwpedYWcTrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=net-swift.com;
	spf=pass smtp.mailfrom=net-swift.com;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5413B606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5413B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=net-swift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=net-swift.com
X-QQ-mid: zesmtpsz3t1795570619td457a604
X-QQ-Originating-IP: 6GFp7SqrlEBydmGFIvrNnAuxnd62oUhSPEyIljA6EQ8=
Received: from smtpclient.apple ( [122.235.140.99])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 25 Nov 2026 09:36:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10479978412546748166
EX-QQ-RecipientCnt: 13
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH net v8 2/2] net: wangxun: access queue counts consistently
From: "mengyuanlou@net-swift.com" <mengyuanlou@net-swift.com>
In-Reply-To: <20261124112414.GJ31322@horms.kernel.org>
Date: Wed, 25 Nov 2026 09:36:46 +0800
Cc: netdev@vger.kernel.org,
 jiawenwu@trustnetic.com,
 duanqiangwen@net-swift.com,
 linglingzhang@net-swift.com,
 andrew+netdev@lunn.ch,
 davem@davemloft.net,
 edumazet@google.com,
 kuba@kernel.org,
 pabeni@redhat.com,
 hramamurthy@google.com,
 jacob.e.keller@intel.com,
 przemyslaw.kitszel@intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <15430CE6-8AD6-43CF-AACF-1434B5EB666F@net-swift.com>
References: <20261118081329.39551-1-mengyuanlou@net-swift.com>
 <20261118081329.39551-3-mengyuanlou@net-swift.com>
 <20261124112414.GJ31322@horms.kernel.org>
To: Simon Horman <horms@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:net-swift.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: OatzRg8pHEjpYKWP88kTrOI1D2sW3Rn9nx7aDgbJsfw4G4QgU1ZeOJ/v
	0akafSuxTp40n0fgKEbOz50F3i7LduljFu/GJ2nQrUQ/d/pzphT68gptiN/iQYzTdmtTUH1
	sKdpVSylFygHuqLfcQelHi4GV9CXEhACkOjkbs7EOKmieAO9Z3Q+AvGgTVa7RhnFwe14tip
	anZLl/etxmmcE07i751oK/fjuG9XSSgw7qwskRI1E2soteriysQByjle4jJdzusnkGQhY8/
	D9rcf91eKV5wYdsGJwDyldscZ7a+U0UcP8nUcI+wpgkJv8xyd8TcFdcv1fZ4U0pStlSt0nW
	nFeSGPXVyNPr5c/GIpKVhmQXBSKvkQdBErSxHuu8/hW5ebHDHTq1+jd0sZcIj5K2BkFZO/u
	Qk84HbYUCEEglL6qK44TrEPfboaLGRYCaf/LLJ1U+TkCmptnoDMg/MEnyrZQX47ChWor9L+
	+kes2FTfrRx2pi5aZ1SO5lANFGhkCH5+DOlJI8SUs6QWqpS/JxO7gZy261Y/6DTIkRY28t4
	OKL1sLIES8yTllImTba6D9geNTLtXcF5NlZDriAA7NSBBk3/DRfv0ooOSma6sXL3ToCTe2V
	k+3F8rgmBCeFM38bkhY4eU53HzCO3k9R0fuz/NpaHNgSLM/eisPd7EjuSgeBQEsbDoIhYc0
	AhCB86lOgfY1R4YvFwxKME4ILsGEV+Eog1104HzJTbA6ziBxU2WGei4mjq23oeclS8GXgyt
	DnqBtqeKfNCk4bwx0cliORbntq3l0bCq4M0nLtw1I5HjSttydIlX3N1ry9kpPnOvzDFprmd
	+JzRcqIkEhrF385KT0WMczAgEuuIhsMyYSKDGQ7uX7quMWZFYmMgeC99/BWPh7ZQ1FIg6gP
	UW8UcfcDwQzSlw/f2jW0Ewts2bKonU2wpitNaF+KrGz2a2x3DATWSUDSIcGnmnVEWAeQXuW
	f4NNL+DNh+9QiryVpg9TGQrjfzDhwFeCyBcyeg/OgOy8g36P5wP/9YyKWf5xlPaXPYeKluj
	1eI8b9Zqo+DJBl/Ub8Rse5sTU9Jdl/D+8yQZWQnWYB89syK8/KvLQucjNFiGA=
X-QQ-XMRINFO: OD9hHCdaPRBwvHAMfSpd+7rxQcsAHh3u4Q==
X-QQ-RECHKSPAM: 0



> 2026=E5=B9=B411=E6=9C=8824=E6=97=A5 19:24=EF=BC=8CSimon Horman =
<horms@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, Nov 18, 2026 at 04:13:29PM +0800, Mengyuan Lou wrote:
>> Queue-vector teardown clears wx->num_tx_queues and
>> wx->num_rx_queues while the netdev can remain registered. Lockless
>> readers may use these counts as ring-array loop bounds while teardown
>> is clearing the ring slots. wx_xmit_frame() also uses the Tx count to
>> select a ring and must not divide by zero during teardown.
>>=20
>> Use READ_ONCE() to take a single count snapshot in the lockless =
readers,
>> and use WRITE_ONCE() for queue-count updates during scheme setup,
>> teardown, and allocation-error handling, including the VF queue setup
>> callbacks. Keep the existing NULL checks so a reader that observed an
>> old non-zero count can safely skip ring slots that have since been
>> cleared. wx_xmit_frame() retains its zero-count guard before
>> queue-index modulo.
>>=20
>> Fixes: 3f703186113f ("net: libwx: Add irq flow functions")
>> Signed-off-by: Mengyuan Lou <mengyuanlou@net-swift.com>
>=20
> This patch feels more like hardening for net-next than a fix for net.
> But regardless the code changes look good to me.

I think so.
Should I resend this patch?
>=20
> Reviewed-by: Simon Horman <horms@kernel.org>
>=20
> ...
>=20

