Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=66.163.187.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795356297;
	b=yHwuvjPMsXVJXwtCbl0UtCcSDOavUU5YL/z0Ur23EY2UQVKGYAGeb7erIGsztBIvj8fU
	 wsoRbj2h1QpBu2yhmMowYT+bsnd9sRJdX9aWdC+QLe3WUINNCVsjwZxQYmHu29pJFuON+
	 PGlB24B96QnPpVvpybFvUvNYkoeYGrt3o25rYuAbbnCv6rfYScYYDYirvQ/yK9dvkznMF
	 OVDrZ7BhmxXKsnsrEz7Eg3FzpsrY8f0907NBOcpRorar6NxAl1xzKflgy8ha4+1t1gvvu
	 5cq1Mc+yaHcnbjBK4AG1yHF2uB47KZZDB4AIIMNyza1FZwEpIn8obXHDp4HxtNl5/Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356297;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=mWKNzFrIEoWGXWBj9Nvlu01OqKBBfQlTId71xW2jbDA=;
	b=zw4Ohanw0+RUy5z+XCJ5O3gy/dPRjQnJqd5z82vVpQ+M4PVRRKA+4V136sWvH9kehgJz
	 T+ayg7NK9fgnxc5HMPoY+Djwb/9POuvQQY54Z1+HbmQW63+zMS2opYQgKqb5Mp9bKjbTU
	 zwXbM8S+CbiB9KeKol02Onxs/CO+o51+KfmJuJucCU+2AlQUo0ZiHdcmON6vK9MIjy/Co
	 pjJowld36kcmlyNE+VoK0PgvABkRySEAGTt3SxcwVumXx/I/IYf92/ZTVu8eKnYrV51Zu
	 RY9R71G30I1gKEWPgEf8yt/OE20REiulfEkw3Rx76IWkKUewN1TRkhJbcnWSGuXW9og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=iDsrNl0l;
	arc=none smtp.remote-ip=66.163.187.146
Received: from sonic316-20.consmr.mail.ne1.yahoo.com (sonic316-20.consmr.mail.ne1.yahoo.com [66.163.187.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4333B606A320
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 14:04:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4333B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=iDsrNl0l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795356296; bh=mWKNzFrIEoWGXWBj9Nvlu01OqKBBfQlTId71xW2jbDA=; h=Date:Subject:To:Cc:References:From:In-Reply-To:Content-Type:From:Subject:Reply-To:Content-Type; b=iDsrNl0lmT9STDiTXy0WCE+jJtny+rfGpV9o5r/2XX2XG/j/606rKx552yXZ4BrejzdyhuNDsUNx5b+tPaIPv6hkqef0z+FzkBgMuBrV0iNAPVubD1+i1JAPyMigD5xKfE0oMo1p8tWCTox4WUJSIMB+f0PXEQQCPXMg9PYsp2TkRlWUzu5NckQlGiXF1nNYbhVtQUI7uzIxipKLIpMn5Oh8qgf+sz3zCzhci85YaoUfGLcG74FGq3xl2ieV00XIb/Z3e/1jU8c3+Vunx+ZE0/GPhjB4z+WeBIOYhJ06RJ56bNkHZWl5x2WIozR7qhSh0EQnw56D3d6NK0BXjf1wJQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1795356296; bh=kUIE5LF1O5jeVLhRdT1vUXruunTebnd+xhr5EQmxbpJ=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=PaxF5MTk+4in7np0pbSca0YLAb5BYD6vFSlqa1auI4I8DeXwt73FiUdVo3d81mtzeWPFSYVWmnksjOiQ8kB7rvzVVkQSgjQ9F0Hh8YYn/RROFMqIiCLF4mR9NjyJUuE9n/FrBr2HZOlFm5T5IdyEvQiTeRnMGPNAwn/kGtMF3lZ/wmY8uYIqh6UMR9F2fLnW2m+KhlUjXUs8qR0b758Z6r42mGOMmpyrwmhQoVB7Kt2m6hczVQd5WIyv+3VTXMig76O8DxacnKVgZKLyLeuncJiHfRNAfdBRht6iSAgqVSD4Rjh7TVVw/4mY0r58PgLmL/mCPlN1iRQjSPsmnmvu6w==
X-YMail-OSG: AB90QbMVM1loaVjKRTV2qZz8YLV98Un574TCXgaGCjHQ.jE6svuF4MDVwcRpcbn
 6rSBqLVLsRWa0xxInhrxzdnA_iUgHi0y.pPi9ayYvEYQcdPZ3OmFrK39KNp6ac.TtUiYdgOFg5FO
 KFwOhyNHk8cDX7gX_xQZW_DjNCjvRdYUssH6FvJuHXr2Jl0hc8jYIZo5Mr6L7lCZ1WBjToL8G8Rg
 M5F1CSYzDp5LYo6LNcwpmQMsTfiFAQ_7RpR6S.ztVR.GNdCm_yHBt1p35YqWMKTtiVwhd_UexkIW
 .z2kzRYgiUPLLxFG6mFMDkMd9bX0oIS2k5wRSWmpy7Svj3UEXOWgx3u1tpoZXCKUUgJ2O47dP07T
 51oUDjSxqqSw.Tf9IuJRv1r82cDYXYiTYUe.FDWfg1oLSsUbunilNmw68LVFCPxoKEIHCFTRQltb
 _Qd3CrPuJWnObl.4xCT6dhxQwclq3j_BXwlshXuaZkHtzZ9G3PruX1pzX6ToTIxA5Mr1WasQ8T9s
 YYZnPMo1ljbsrVHiNBzNLTGWITCnr.ckpy4MYHRJ8OSTjEl3vvGioMHOWDlt9xT_V63hncyB76ks
 _pBSPcN5O4B0b6JHceIhAkMifaZHaPbCLzunezNTJnPo0iZHSHBlLvt_4d7L7AaufbQVojOR8iCi
 30cQztJ7laKtYMu2V1fUWZduvnbTa1nzCsD0lFl2pke6SoZuw64BofWJg3FdBrWtI.69YojI0RRf
 gBQWhn9FfOL0yzd7kf__SmjtOVI4rcUI8HW0jW2tJRoU5YTeM8g1pEilQgJgDWCzS36t4XITl.Sz
 CTarc4b_2jhyOtCgEgB1aR6aHn5BggclESHc3Sg0nr7aTL2Hk9JBqaj4PwFpp4PIHJDrmlvoFFCn
 J1a1tgTFXTsKnqzBJtRIPgqvlnCxuTBlqxWMqdn6WMHUhKcXuCJXB8dnNzmOLC.inQwerbDf4PZV
 ePL8FDJM0gcTZXYV7ajoFf5CaGjMawmZa13iQrlhk4NrWoBosk5v9vvVUVTh5Bb_01XOfbNja.B4
 FPskU1BGH3h8yfMdbCnW8s6Rx8LyfUiEH3If7jqqLUV954336lgsmfpqvMsCyNr1trj1cLFGr0Vi
 25ky11KeWRIy.2J4gx8Z20oYucJUK3uxvAuq7RKBlbxkkWBHZUGAIlCobqZze1_PE8mrP1A3ue4_
 .PL7drwuW9YuSai.uAdNy5rxxg1EdN.Q28UuNF9bdPnlv2zqj8rYcfqX93_CBPw5_l2xsKla.vO_
 zJFVz4OB8kdYOeXRaf9YTh.WOewMrVcAXyG1l.6mB1EGKHXN3jYbYcBNJsbja4.g_bKLmLtM6Rsa
 niPofx4kjAedRNKsTK1QCHho4nNp_KYSES5RQJha.KGKcZR0rgVbxCNepc_yMhrOpw9BNfp6aog5
 3n7yi.c52Yo5mWKHeLzMTrpGcuasZIpT7fm2Oet00iuLGcQNAu4lI8P2RpkrQjzLRbW52t1K6ceO
 Lbc3em55eAONhA3.WMWxEeliAmfs67rzDTb54.G8vTUZWhfQScR7YVvzx2q35hDOn.enuurOsJ8_
 5qnKwwAyzHbGJWIM9iEDf_J3aO5K3ySHQlzsOvp5e0IYEPcJxf6GdtzwkgHO9xHE9TFCTNXwbh9j
 4ZnqGD9IAoNahAjdhkY8WNSfuXyCeGtqbMl8hsIqhezw94oNt_beGERRKg2RCLR8HPWAWMwwLmF9
 WmiD.eAn_PLpYRnGV0uHSfw1Xm2Nv78sBQkST6qlWIQy0v_yhRKnePnxJMT0nmGz9rc6nEkQ1Omu
 QiASoxvAfjTsOBx0aglpy9Uzz51CuxwDDFNi5.Vvr9WH93YbCh1ukUr47EL_QrXSIWNykzCn1cdo
 TmNoJHC0yA7MROhePtCRWfkWXH.Gnb8_jjC17bskJUfeCXuwG4SifgK2M9Ab7UKuca773Zk4IO8o
 MG6kOPAoI4VxQEyxu7zaH0AQIqf8wyZ5tc1HpBxzehrklXVZR1gLCc9u80qkhT6qmPmEnLYhHRxQ
 Im1OjX0XD8jzG422mC3D6IPJ51gLsTYJSaklKlUQEhWP0thzYWLr7R4x1.ULl35yspBhT23_BNAi
 zB6GBQEY.8pd_aiDlZZLE5SdiN0iqMoGfPDarFxpUFjnIBUhMG9iloIo6Om5yXOmNsvDYEU_3BDK
 ZReShG1AumYbzSYRvDNlUkCNl665GphmIyuUUy_CeL5xXEUer.HBuNUvcN06vtsUn85gvYtb.zWX
 LK7b1fWD4a8zdqpMVZAmHch.9SAynmjgkOLPL8St0C8cQ4KmZfR2mMll9aW7L2.2VdAVr5U754PU
 JNERWvudiOHZAJ44g0hE52LPYdoANvTE9Cqrq7QeQUqTZlVjdNmUTYw--
X-Sonic-MF: <namiltd@yahoo.com>
X-Sonic-ID: 3f91755c-966b-4ab8-b4e4-e3418d8c595e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Sun, 22 Nov 2026 14:04:56 +0000
Received: by hermes--production-ir2-7c4859dc89-jpc6b (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 82a84b51b909fa92bf99ae6f190b6c21;
          Sun, 22 Nov 2026 14:04:50 +0000 (UTC)
Message-ID: <c963f0ad-65fd-4d2e-823e-5c63251e2fe5@yahoo.com>
Date: Sun, 22 Nov 2026 15:04:47 +0100
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
Subject: Re: [PATCH net v2 0/2] net: dsa: realtek: rtl8365mb: fix FDB lookups
 in VLAN-unaware bridges
To: Stijn Cleynhens <stijncleynhens@gmail.com>, netdev@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
References: <20261106150225.3700205-1-stijncleynhens@gmail.com>
Content-Language: pl
From: Mieczyslaw Nalewaj <namiltd@yahoo.com>
In-Reply-To: <20261106150225.3700205-1-stijncleynhens@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.27100 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On Fri, Nov 06, 2026 at 04:02:23PM +0100, Stijn Cleynhens wrote:
> Tested on OpenWrt's 6.18 kernel, which carries the rtl8365mb backports up
> to v7.4; the code these patches touch is the same as in net. A station
> learned behind the uplink that moves behind the CPU port answers 10/10
> pings, its learned entry replaced by the CPU one, with VLAN filtering
> switched off at runtime: on an RTL8367S (TP-Link Deco X50-Outdoor), and
> on an RTL8367S-VB (Deco X50-PoE, with the family D series applied and a
> family D branch in rtl8365mb_vlan_pvid_port_commit()), where it also
> passes with VLAN filtering on. Before these patches the RTL8367S
> answered 0/10. Both patches build without warnings with W=1 C=1.
>
> Note for Mieczyslaw's RTL8367S-VB series in net-next (v8): patch 2
> replaces rtl8365mb_vlan_pvid_port_set() and
> rtl8365mb_vlan_pvid_port_clear() with rtl8365mb_vlan_pvid_port_commit(),
> which gets the target VID (0 for the neutral PVID) and the filtering
> state. The family D paths that series adds to set and clear become one
> branch there that writes the PVID register and the frame filter from
> those two inputs. Happy to send that as a follow-up once both are in.

Hi Stijn,

thank you for testing on an RTL8367S-VB and for the note about my series.
It is now at v13 (14 patches): [link to v13 on lore]

Since you have family D hardware and work on FDB lookups in VLAN-unaware
bridges, could you please take a look at two patches of it, and test them
if you have time:

- 7/14, which makes IVL_EN of the 4K VLAN entries follow the VLAN
  filtering state on family D;
- 12/14, which handles the L2/LUT differences on family D: no EFID, so
  an offloaded VLAN-unaware bridge is put in FID 1 with the port-based FID
  registers while standalone ports stay in FID 0, plus the lookup-hit
  isolation fallback (0x0A10 bit 0).

12/14 changed the most in v13 and has had the least testing. Your case of
a station moving between a user port and the CPU port, with VLAN
filtering on and off, would be a very useful check for it.

Best regards,
Mieczyslaw Nalewaj
