Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.189.82
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253624;
	b=zfF1vj+g75nAjoOLYaUMmZFfp/k9bn7cAqz7QeRD/IRgAOLwAMJZSinus0Scu8QFm/PY
	 xKOdEbMzIjDibBLq/6KkuhDzXqz3InVVrg10c22hGXNYEUf+p767b5O0tJuO5wC0bsxgm
	 cRb5V0KM2tNROlIO+LAKY1Dmkv/DGdCINYRhh7eHUd4HsJHA/zqVb3BT3au943jrU/GQ8
	 K4oX/LZftou8pTLesCIOWj6d3hrOsaBWV/uWfRClgJiyMJfbZVaCtcAOF6/euVIHFEn+c
	 l8w0VJ4zMUh5EzPpZ1sUm6a7wfZXeL3366CmFTyYOU7OnZEcRYiFRKkPfx+KI9rhW3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253624;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:From:To:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=CNu+5mXR8F3BaubTxtuuLjIYWUjilXwo9wCyPn2kV8s=;
	b=Fggmx2WUpx9EQl57GCNyPZEhTFLDzQlTtOgaBxDyQmy2wv+OSZWhUm2wL4gouIu4F5J6
	 3JcF9dlyTMrPdEYO0xucTzar6ij7nx4ce1dcxJKRdqMmrLx8QAKbEe4s1CHfVJOXhyy8c
	 qAqlY7ozTphyzKJ45xI/EVZFWy9wNx3bVEqxnQxpcF96KzyFZwUZcKAFHIGlY6MlnNgWb
	 AGEylQqmKPm7q125mhqUJca6hOhBgY7lPpgjfi6CsF2t4w5NzjkH/c23iVvk7l21XOU1R
	 vRbL31GMpGGyugR+tQvqQGMMZXkInlC0fwnOnNMlOmIY3XfnVX2uL8ueJqAkn/TP+YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=oqKb5cnU;
	arc=none smtp.remote-ip=66.163.189.82
Received: from sonic306-20.consmr.mail.ne1.yahoo.com (sonic306-20.consmr.mail.ne1.yahoo.com [66.163.189.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F442606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 09:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F442606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=oqKb5cnU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795253622; bh=CNu+5mXR8F3BaubTxtuuLjIYWUjilXwo9wCyPn2kV8s=; h=Date:Subject:From:To:References:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=oqKb5cnUrfB7e+WQWZM7DkfdJEvds7kzFzvoGP5cfd9BW2fbggFz/LY8EFgZdpXqDeFHIErRN9gOe1WJeseEW+IbGyBOy2QbTPR4ktDKPrEY/y3eYJL10dkpYiH7kPbLytFPbWtqMkaTxMYUr1MDh5sX13AXiz+RcNP2nCAicTTowfQ2GGmxdBydb43jexyAyla+5SJARaY+uqpZetOVL0S1hIOTYkUYYg2oQOKuPHz0tJUmtg3KR1fXEz/1ILqvZr5xj9Fn3sU4VcbDmvwflx0o7X7JUoVX9MGc4LPDP7X1Q/tu+awXO+IcBl2XLIGwQfucmLJ/Gam+ZgjrxknLhw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795253622; bh=l0SDK8zF3GBDKk8p1musjahKFyHLDlmDVNfMvIqhdVv=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=jGsFFY13zrm2Z2XL9dT++AgY9XJMY0N8qSnrT3cdMDWsHVYLiKGDya6OXpyYWzQ6JiGhYJQgGtxHr04tr9zBKy5Ax4D2PVvfmgs5YwergqZ3gTVpaDeJrUfQ3ZPbF2pJgFZuQfj3GXYzBKsQucVX589+aV9ZdKnJ+nZkHXZDQCUWCRq3YwRNUZyHX9Oby5nDy+7QOg8Wf9N0oCUhcmR8g9SyU4YLlFcpAz7hI4afYB8S7W4zRkcTKZ1QiSF6aFzkvHZoy7Tbph3YWWxT99CnQ14jfq8uHwFt6qY/rZdqjWs6XfZYUL8gd9H4bYgULKgZsw4LzF4N9aTn+Cbgz4kulA==
X-YMail-OSG: Jnia4v0VM1n7g9G2Te_LFE95xvF8QqE6th8OK1CJf_IsirwRO0OseP1Z2rgAs9z
 RtheXQ1ZF4CfHXGgKEgKAxEp_D6J_MqSg1.H_wVNRin1VHk40PPyL4TYkgzJ3aFyVyMNh7xEyviC
 SQsoPbCsNpJN8Xn3n6kYcOY738SGfJSApVRwI.jkiWQfpXbTmCYt7nyFRrxnk4IacRf1.O2rdCEq
 QNYUl34SccqSYgQAz6iBPVlFJDXLbsZhQNSCo_Y1MBOx9KGLrCUlWa8lb.4Yr4l2p7JQsRPmONwO
 7gE1TpNh0GET158G5Rv4tzUfsrRQrv76n0VJ_WdBUAhgrRrFLp7zSV49bI2qy3jxdIiPq.oc20zF
 c8GGz1ukE4j3eAtI4dx__DGW6eNYPC9r2KfjLRdvYMG5HacXXdGIqaWdZXiJgT5Fs4ICCkfdunnd
 cH5ILlL3iIY6f7_XY0kCuQvFBNopcL0KPp8MtHo.i_IWpsJq_3DMxL0fQWg_BA181UiXRFmqHUM9
 MxwgWzQAmjqwipMwhvh9H8M.kLgHcN3VQ0Ut2SGfTkwbfnH33SnzjA6JfSrwtBWm8wnx.SticsRU
 EwPHpJHrem9kP.wYG9qDcVZthoK1SsL7GD5Sxm8cDdQZc79FidxOlwpDQMPo0aFF1QUUeZZCmF2o
 6rOHYJtDATvy11Wz4mradF2uaAh2pewtjH.3mkPQgQ.U5GY19KZlYqstZsUPcj80bKFBQJnuDNZY
 hp73wOsX.RVDnmGlq8dtFke2H9DRGP.IKQTgr4U11.InofKTpzjbJY7jpqSw3zPcnyfYkD_Hg35m
 ydvSZmTAEZFizOr9YItObtCk8FkdJOGJwAFtpr_XiTmXEVtwu5O0ocgjuxEUvpLMmIR5mAd31N.j
 2jgUcgQACaDcxHJOylSMPlGpTHGAdTisAGN8wqytH7k03MBr8X7OnJziaHeXoI6Hg0.6kZLsnv6u
 rv2AQs1XwX5T7CrwKMU5f9fTmp6QdL3Ley5GfHoEL9G51Ig1_UJwgJgwS6dSCZIuO4JUw9AOXRlz
 AaHSJVE6oFjxsoNKhVgl0.93oV96QLplRGQZF9Ws4puTwRAQj9L6gO2wkezg7bbJueASnuJ6juvN
 tiHmx4vNl7byTgEASLMeQwCnHT_zf6zBo387kQUmFuPnKcR94yTjPQ1TkLd9QHGa_x8ojiMbZH9T
 a16Q.oPkZEQohzf0ILxanT9j6L8l7GKYoeOhjltdqOZdPsFvdLedd8aWvJePpLarYm10eQJhGXu2
 IxBBIHcSh8Gcduq0HgSc0LzfQGHlstpV87Z5.XoVCwJj.7w2HVNcwd0NaRg0OAvVA2gxPYbvzdc3
 78AKeWTQ6nWWAwjjNgYtpHfaQ.5yNNGEbcqHzHTnUOFSzsW.pU7.4u4Qc9OhrXbmr_kt7ugsghz7
 iuW.PGvrzYECd1.kK8LVf5dJaYhl6vrD7RoQtoYWJ2scSWGJjpb0Rfx_ccLUuwh52xeYiNdj5Sqv
 6tk6_gcc7oyp.LZDny_o__QHMAkCtuRZyKF5.2tgyTltkIABiX3vMAktL2.CX5eh7.XJFnzy9GeJ
 9zda9AzFBFmz4Svm4yunjS98ymgTE6YN3c6JcJpjjzYuTaLq2udfI3XYxa1rRM6ONbk_fEfrZxrk
 0TxKhJWIGaxpNkbUcdz_lPUkqRJKr3hZ01NBkVFOq6w_vV57i9Vq8sHG06mO.g5iGUyqVRNghkh1
 a80ZPD45iwxn.v6XBgo.I4OGsv0S8iNm5lePdhD0N2JPBiY7Tr3aG.vH0nTk_9dpItEFkg4wG.5e
 KncsDaSq5SaMej65Swd8Zh.gvLoJYrpQZLvX4BEQPWSH6A6a0.Pl1PMUtbZeGr.0ixOCQEDkuFhl
 cL4hvYFjzsynmPKKH.QNCPsbpxFdElDxj3uiC_xlR_V6hNiwZclAC34L0FNgeas8zRRJ0xjh7xY.
 OLYMn0ARmEUi3pDcA0aiUyt2sMnJ6yetkUogMjxb5zVDXkOd3zl5guFNs9RIQmyJh02arB1nVUDU
 OqnEIvLv7zMHPVXbrGWrtpqnNU_kSiUqi1lls7QS8iV8V_fzsnbEoiO4Sqb9EihRlR9SEhXJctpv
 JYzp9U1ITU4dV2khwrJHnA1PhPZoxdnMgo5PEW_GFsGSz1yk0aHeGyt5YbN.4yuFzSJuX4kLu0Gw
 X.Tt9teN.MBeAUiiuAzKORtkCOxbIEafn_Z2Ws9nEKTbU7aElKPXpewOAA2SWm.yoBJp5pz_hLdo
 uUPNKegxAnIjHH4utitEJIbGVVBjFkCBXbuljSqWcJNOw4R8G3gqVSO0LWGJ348PaA5egsObpxCA
 YogiYCSm_puZyRnEyADCgKMFT7IwyoBkbNQ--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: ed938903-629f-41e9-9f94-b507ffba141e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ne1.yahoo.com with HTTP; Sat, 21 Nov 2026 09:33:42 +0000
Received: by hermes--production-ir2-7c4859dc89-fxzr8 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 67e278fb34469d5c06b0489965fa145b;
          Sat, 21 Nov 2026 09:33:37 +0000 (UTC)
Message-ID: <1fb7feee-3e4b-4313-a596-29f2ad0de1dc@yahoo.com>
Date: Sat, 21 Nov 2026 10:33:34 +0100
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
Subject: Re: [PATCH net-next v12 12/13] net: dsa: realtek: rtl8365mb: make
 L2/LUT access work on family D
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
To: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
References: <bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce@yahoo.com>
 <ca39376d-37b6-43e0-9dd5-7d431d335e63@yahoo.com>
Content-Language: pl
In-Reply-To: <ca39376d-37b6-43e0-9dd5-7d431d335e63@yahoo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Subject: Re: [PATCH net-next v12 12/13] net: dsa: realtek: rtl8365mb: make L2/LUT access work on family D

> +void rtl8365mb_d_l2_data_to_mc(const u16 *data,
> +			       struct rtl8365mb_l2_mc *mc)
> +{
> +	rtl8365mb_l2_data_to_mac(data, mc->key.mac_addr);
> +	mc->key.vid = FIELD_GET(RTL8365MB_D_L2_MC_D3_VID_MSK, data[3]);
> +	mc->key.ivl = FIELD_GET(RTL8365MB_D_L2_MC_D3_IVL_MSK, data[3]);

I noticed that, unlike rtl8365mb_d_l2_data_to_uc(), this does not clear
key.vid when IVL is 0, so the FID could be taken for a VID.

I do not think this is a bug, so I am not changing the logic. I will
add a comment here in the next revision, so that it is not mistaken for
an omission.

In struct rtl8365mb_l2_mc_key, vid and fid share storage. Reading the
field into key.vid therefore also sets key.fid, and with IVL=0 the
field holds the FID. Nothing is reinterpreted: it is the same value.

For unicast, vid and fid are separate members, which is why
rtl8365mb_d_l2_data_to_uc() has to split the shared hardware field by
IVL. For multicast there is nothing to split.

Keeping the field as read also makes a read-modify-write go back to the
same key through rtl8365mb_d_l2_mc_to_data(), which uses
ivl = key.ivl && key.vid and writes key.vid as the id. Clearing it for
IVL=0, as for unicast, would write a different key for an entry that
has a non-zero FID.

The driver only writes FID 0 (VID 0 gives IVL=0, FID=0), so there is no
functional difference today. The comment will say that vid and fid share
storage and why the value is kept as read.

Best regards,
Mieczyslaw Nalewaj
