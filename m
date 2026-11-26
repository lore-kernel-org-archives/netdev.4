Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.243.244.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657762;
	b=xh5IZtXxWVlgTPA8mBsv8qZwh1eaNmyX5/LEsaCsf52nVWc7BUN7XoFCDrAzk6zeClM7
	 tPKkrqqJH5exwKDqhty5z3rldGJsIkmshZhR+KUyTVc55nRgDDFyt8DaKbuhVsl0oqlWO
	 C+WD5oAfokQeKBJH9TJYvbpXj0QGPZE0ypnwnGpBZT29DTeYQwCEQHJPIThjd0AYT1vW7
	 J5WSj4jERi+MIByBfz0+fcBPVoYt152mam543TrsiBQkMTyv2IIdYfem9sD8GzUMI6twx
	 z0QqA9ViarJ0IJoL72Nv0JFdtstjDdrk18kgmhs/Jln8JYmZ2weh3/7SXyaF0IdXjmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657762;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Content-Type:Mime-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To:X-Mailer:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=one2rjhMV97z7CnhF3g2QeZCaS5E0FMAwJy7eHM6zDU=;
	b=oU1RrGQ+/qaYKqAASHzRf6ACzDJaUx62ufgFABHmoM/81u4+r8VKBfwzfMOMkmpMz170
	 dNjbMj4HYIY2xwt3xk53UTazAn3gIr2kGTZivTGZLFviTlXPsJHmPGWvkY96pj0kwus4q
	 wqLTvxmtCdarUOEqJ5ipfIzDmPlG5ipdmCRHmo5CU8cGsexHHjx7NeZCM/Vamo1c3aiKY
	 25E0NvTVZHm8GZojeSmMU63E99vxHDGhCoPGLHHMQLS4GqPUBqh+B7Z6pu2NHQC7Cm18f
	 ye4e/sETT1dYFq8SFBYXjDrzMjSx2CNFFws88i0eT1wXbjFoaGY10wuYmoy+UVSSiJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=net-swift.com;
	spf=pass smtp.mailfrom=net-swift.com;
	arc=none smtp.remote-ip=54.243.244.52
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20DA606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E20DA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=net-swift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=net-swift.com
X-QQ-mid: zesmtpsz5t1795657669t32d10466
X-QQ-Originating-IP: IufVKh5qgEZlgIZbILdC8d6X3ty1stUlAcQhZ/Ee9RM=
Received: from smtpclient.apple ( [122.235.140.99])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Nov 2026 09:47:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8537531309841994138
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
In-Reply-To: <eedb9d27-1738-4911-bdf4-327963151e96@redhat.com>
Date: Thu, 26 Nov 2026 09:47:36 +0800
Cc: Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org,
 jiawenwu@trustnetic.com,
 duanqiangwen@net-swift.com,
 linglingzhang@net-swift.com,
 andrew+netdev@lunn.ch,
 davem@davemloft.net,
 edumazet@google.com,
 kuba@kernel.org,
 hramamurthy@google.com,
 jacob.e.keller@intel.com,
 przemyslaw.kitszel@intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <DA953E71-9604-4728-8401-20C2474096AE@net-swift.com>
References: <20261118081329.39551-1-mengyuanlou@net-swift.com>
 <20261118081329.39551-3-mengyuanlou@net-swift.com>
 <20261124112414.GJ31322@horms.kernel.org>
 <15430CE6-8AD6-43CF-AACF-1434B5EB666F@net-swift.com>
 <20261125113050.GS31322@horms.kernel.org>
 <eedb9d27-1738-4911-bdf4-327963151e96@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:net-swift.com:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MTUDNdg/0gsJKcbYNLrpxAgJYZHDS7q+9vUWP1epQbSpVb8hB+v8dRnd
	JzPKyjkRyYpsAWzpl0AZNwtuNe4x1bADmHB7/6Z1LFQSAWBqKJlsTbUp/O0n8TcbNTzO+8Z
	JgOlv29x0SdTEfkUcEx8/2ENqptodLNiN28OoIpFUAAGRykEIRCiXfwv1WjXi6qG+Zkb1KL
	kQ81YrDhkzKfysMMYGAg9JKjCQJDZDwWsDXb2BjK4bq0ROx6OO1l/+22UFSuwL5QJjdDwjF
	73iCJeoHuGdv1hYLk/HQ+CWA2MA0nvnf2+U6EqdFKHZRvSL+DynBtgpkbyEymIAdhIx42eP
	/IYplpH8iX6Tk/TMq9rtzaTxfEnEe36TaHATLyY80jUDCleOc2C26Onne1PLBNbM+/cCkLG
	tusEEaGAjrewx5Cs4CgBG3Ar3nNTRy85ygMa5ndY4ggRBPme5hNojZXYSZmwp5XvzriPxFO
	Eo7JIKEfXVvAZN6alHF6dYbJvoo8eeXoSOnbfXf/o7Bo4GfrwHW0lfW09oNwXSl11Qr9Zi0
	cCBXGROoXoVtDIu5GQuI/BJm89gX4xiKv9yk9ACeRErEVRnlKnk0m7T3rVzDFehEz79ObUC
	NtlVg8YVslDWFy+xThjt3y/0+KwGqZY3NZOT+aug7Icqrt6Nji40FQu+6z87IrivwM+mXvS
	F4Z+9oyH8geJwAnxQK6wj7kc4PRnAL0Ch7TG9cCHtZFlY5tqUcWgEJ6QJ2hqPREfLQdQhxZ
	7P3AIOZyQjd+aVGJp9h1yOUoVqGaH//qimc0JOUW5VKS+il2Xo4ag3KMQyofeeZxQ8fukcq
	FZ3E8AKbOvOedlwPeBrkmC3SwA6g0Q4rRQw94UOXqbNgz30AvbXFPAa6jXtF3S0MVAhQx5U
	vlvAnU2nF9uHlIQ/HaUcKf8G8buXYL/97kk58npXCSr8uMdL+hZkxDdOIiyNc6ymktC5p5p
	3ru6NPoqBIRFWwHI0WMHuUMbSJ8CPPBkZfZ5cm5XGeVZuX5rfJK287jU2ZMZovVTNND0Gin
	iy7Dp/axefdeevUHgHUgt76xqogHs7BUjI7wIJ/yv+gNNfBS/7uKDUfn09bvbvQc42JERe0
	fzZhARO7P/wTg+3b2RrufL3DCP2FRceHx4QFJXIlpSufzBNIiBUbsU=
X-QQ-XMRINFO: OD9hHCdaPRBwW7LXK9njS5c8ak9rhTx89g==
X-QQ-RECHKSPAM: 0



> 2026=E5=B9=B411=E6=9C=8825=E6=97=A5 23:10=EF=BC=8CPaolo Abeni =
<pabeni@redhat.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On 11/25/26 12:30, Simon Horman wrote:
>> On Wed, Nov 25, 2026 at 09:36:46AM +0800, mengyuanlou@net-swift.com =
wrote:
>>>=20
>>>=20
>>>> 2026=E5=B9=B411=E6=9C=8824=E6=97=A5 19:24=EF=BC=8CSimon Horman =
<horms@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>=20
>>>> On Wed, Nov 18, 2026 at 04:13:29PM +0800, Mengyuan Lou wrote:
>>>>> Queue-vector teardown clears wx->num_tx_queues and
>>>>> wx->num_rx_queues while the netdev can remain registered. Lockless
>>>>> readers may use these counts as ring-array loop bounds while =
teardown
>>>>> is clearing the ring slots. wx_xmit_frame() also uses the Tx count =
to
>>>>> select a ring and must not divide by zero during teardown.
>>>>>=20
>>>>> Use READ_ONCE() to take a single count snapshot in the lockless =
readers,
>>>>> and use WRITE_ONCE() for queue-count updates during scheme setup,
>>>>> teardown, and allocation-error handling, including the VF queue =
setup
>>>>> callbacks. Keep the existing NULL checks so a reader that observed =
an
>>>>> old non-zero count can safely skip ring slots that have since been
>>>>> cleared. wx_xmit_frame() retains its zero-count guard before
>>>>> queue-index modulo.
>>>>>=20
>>>>> Fixes: 3f703186113f ("net: libwx: Add irq flow functions")
>>>>> Signed-off-by: Mengyuan Lou <mengyuanlou@net-swift.com>
>>>>=20
>>>> This patch feels more like hardening for net-next than a fix for =
net.
>>>> But regardless the code changes look good to me.
>>>=20
>>> I think so.
>>> Should I resend this patch?
>> Thanks,
>> IMHO, it would be best to split the series in two: one patch for net =
and
>> one for net-next. And resend both.
>=20
> No need to resend. In fact both patches must be applied to net-next, =
as
> the first one has a functional dependency on a net-next pre-req.

Ok
Thanks.
>=20
> /P
>=20
>=20

